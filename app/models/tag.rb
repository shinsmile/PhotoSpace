class Tag < ActiveRecord::Base
  has_many :prototypes, through: :tagmanages
  has_many :tagmanages
end
