class Reserve < ApplicationRecord
  
  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end
  
  belongs_to :user, optional: true
  belongs_to :room, optional: true
  has_one_attached :room_img
  has_many :users

end
