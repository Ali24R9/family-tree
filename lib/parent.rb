class Parent < ActiveRecord::Base
  has_and_belongs_to_many :children
  belongs_to :person

end
