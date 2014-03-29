class Relation < ActiveRecord::Base
  # has_many :relationships

  relations = ["Mother", "Father", "Son", "Daughter", "Husband", "Wife", "Brother", "Sister","Grandfather", "Grandmother", "Uncle", "Aunt", "Cousin"]

  def create_relations
    relations.each do |relation|
      Relation.create({relation: relation})
    end
  end
end
