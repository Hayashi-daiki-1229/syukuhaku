class Room < ApplicationRecord

  validates :room_name, presence: true
  validates :room_detail, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :room_img, presence: true
  
  belongs_to :user, optional: true
  belongs_to :reserve, optional: true
  has_one_attached :room_img
  has_many :reserves

end
