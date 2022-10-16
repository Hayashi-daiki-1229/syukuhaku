class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  belongs_to :room, optional: true
  belongs_to :reserve, optional: true
  has_one_attached :user_img

  has_many :rooms
end
