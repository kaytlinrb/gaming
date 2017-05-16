class Profile < ActiveRecord::Base
  has_and_belongs_to_many :friends

  has_many :opinions
  has_many :videogames, through: :opinions

end
