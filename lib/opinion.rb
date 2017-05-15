class Opinion < ActiveRecord::Base

  belongs_to :profile
  belongs_to :videogame

end
