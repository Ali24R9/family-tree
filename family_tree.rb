require 'bundler/setup'
require 'pry'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def menu
  puts "\n\n"
  puts 'Welcome to the family tree!'
  puts 'What would you like to do?'
  puts "\n\n"

  loop do
    puts 'Press a to add a family member.'
    puts 'Press l to list out the family members.'
    puts 'Press m to add who someone is married to.'
    puts 'Press s to see who someone is married to.'
    puts 'Press ar to add a child'
    puts 'Press vc to view a persons children'
    puts 'Press e to exit.'
    choice = gets.chomp

    case choice
    when 'a'
      add_person
    when 'l'
      list
    when 'm'
      add_marriage
    when 's'
      show_marriage
    when 'ar'
      add_relationship
    when 'vc'
      view_children
    when 'e'
      exit
    end
  end
end

def add_person
  puts 'What is the name of the new person?'
  name = gets.chomp
  person = Person.create(:name => name)
  puts person.name + " was added to the family tree.\n\n"
  person
end
## relationship

def add_relationship
  list
  puts "Choose the id of who you want to add a relationship to"
  input = gets.chomp.to_i

  person1 = Person.find(input)
  list
  puts "Choose (by id) who you want to relate the person to"
  input2 = gets.chomp.to_i
  person2 = Person.find(input2)
  puts "How is the second person related to the first?"
  kind = gets.chomp
  relationship = Relationship.create({person_id: person1.id, relative_id: person2.id, relation: kind})

end


## marriage
def add_marriage
  list
  puts 'What is the number of the first spouse?'
  spouse1 = Person.find(gets.chomp)
  puts 'What is the number of the second spouse?'
  spouse2 = Person.find(gets.chomp)
  spouse1.update(:spouse_id => spouse2.id)
  puts spouse1.name + " is now married to " + spouse2.name + "."
end

def list
  puts 'Here are all your relatives:'
  people = Person.all
  people.each do |person|
    puts person.id.to_s + ". " + person.name
  end
  puts "\n"
end

def show_marriage
  list
  puts "Enter the number of the relative and I'll show you who they're married to."
  person = Person.find(gets.chomp)
  spouse = Person.find(person.spouse_id)
  puts person.name + " is married to " + spouse.name + "."
rescue
  puts '---------This person is not married--------'
  menu
end

def view_children
  puts "\n\n"
  list
  puts "Whose children do you want to view?"
  parent_id =gets.chomp.to_i
  parent = Person.find(parent_id)
  sons = parent.relationships.where({relation: "Son"})
# binding.pry
  name = nil
  # binding.pry
  sons.each do |son|
    name = Person.find(son.relative_id)
    name = name.name
  end
  puts "#{parent.name} has a son named #{name}"
  # binding.pry
end

menu
