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
  
   validates :start_date , presence: true
   validates :end_date , presence: true
   validates :people , presence: true
   validate :start_end_check
   validate :start_date_before_today

  def start_end_check
    if start_date.present? && end_date.present? && start_date > end_date
        errors.add(:終了日,"は開始日より後の日付を入力してください")
    end   
  end

  def start_date_before_today
    if start_date.present? && end_date.present? && start_date < Date.today
        errors.add(:開始日,"は今日以降の日付で選択してください")
    end
  end

end
