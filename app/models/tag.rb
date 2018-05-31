class Tag < ActiveRecord::Base
  has_many :tag_connect_protos
  has_many :prototypes, through: :tag_connect_protos
end
