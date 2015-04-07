class Room < ActiveRecord::Base
  has_many :meetings

  validates_presence_of :name, :location, :description

  has_attached_file :photo,
                    :styles => {
                      :thumb => "100x100#",
                      :small => "150x150>",
                      :medium => "200x200"
                    }

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
