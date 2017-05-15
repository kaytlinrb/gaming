class Videogame < ActiveRecord::Base

  has_many :opinions
  has_many :profiles, through: :opinions

end
