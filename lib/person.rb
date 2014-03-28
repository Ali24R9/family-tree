class Person < ActiveRecord::Base
  validates :name, :presence => true

  after_save :make_marriage_reciprocal

  has_many :children
  has_many :parents
  def spouse
    if spouse_id.nil?
      nil
    else
      Person.find(spouse_id)
    end
  end

private

  def make_marriage_reciprocal
    if spouse_id_changed?
      spouse.update(:spouse_id => id)
    end
  end
end
