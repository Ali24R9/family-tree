class Child < ActiveRecord::Base
  has_and_belongs_to_many :parents
  belongs_to :person
end

