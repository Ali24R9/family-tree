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
    puts 'Press ac to add a child'
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
    when 'ac'
      child_menu
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
## children

def child_menu
  list
  puts "choose the id of the child"
    add_child(gets.chomp.to_i)
end

def add_child(child_id)
  person = Person.find(child_id)
  list
  puts "Choose one of the parents to associate the child with"

  parent = Person.find(gets.chomp.to_i)
  parent = Parent.create({ person_id: parent.id, child_id: person.id })
# binding.pry
  child = Child.create({parent_id: parent.id, person_id: person.id})
  # person.parents_id = parent.id
  puts "#{child.person.name} is a child of #{parent.person.name}"
  puts "\n\n"
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

menu
