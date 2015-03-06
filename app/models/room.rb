class Room < ActiveRecord::Base
  has_many :meetings

  validates_presence_of :name, :location, :description
end
