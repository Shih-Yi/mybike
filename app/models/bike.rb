class Bike < ActiveRecord::Base
  has_many :attendees
  validates_presence_of :name
end
