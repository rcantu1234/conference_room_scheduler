class Room < ActiveRecord::Base
  has_many :meetings

  validates_presence_of :name, :location, :description

  has_attached_file :photo, styles: { large: "600x600>", :medium => "300x300>", :thumb => "150x150#" }

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
