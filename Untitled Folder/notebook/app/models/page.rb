#
class Page < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :poems
end
