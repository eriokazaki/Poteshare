class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :reservations

    validates :name , presence: true
    validates :address , presence: true
    validates :single_rate , presence: true , numericality: { greater_than_or_equal_to: 0 }

end
