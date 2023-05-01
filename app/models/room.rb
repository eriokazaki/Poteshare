class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :image_name
    has_many :reservations
end
