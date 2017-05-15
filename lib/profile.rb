class Profile < ActiveRecord::Base
  has_many :opinions
  has_many :videogames, through: :opinions

end
