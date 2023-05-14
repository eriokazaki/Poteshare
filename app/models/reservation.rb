class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_people, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :start_and_check

  has_one_attached :image

  def start_end_check
    if start_date == nil
      errors.add(:start_date,"開始日を入力してください")
    elsif end_date == nil
      errors.add(:end_date,"終了日を入力してください")
    elsif end_date < start_date
      errors.add(:end_date,"終了日は開始日以降の日付にしてください")
    end
  end

  def total_day
    total_day = (end_date - start_date).to_i
  end

  def total_price
    total_price = (total_day * number_of_people * room.single_rate)
  end
  
end
