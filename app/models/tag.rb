class Tag < ActiveRecord::Base
  has_many :prototypes, through: :tagmanage
  has_many :articles_categories, dependent: :destroy
end
