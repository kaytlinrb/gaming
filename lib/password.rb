class Password < ActiveRecord::Base

  has_many :profiles
  has_many :passwords, through: :profiles
end
