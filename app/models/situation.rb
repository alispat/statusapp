class Situation < ApplicationRecord
	has_many :components, dependent: :destroy
	has_many :events, dependent: :destroy
	validates :name, presence: true, length: { maximum: 255 }
	validates :icon, presence: true, length: { maximum: 255 }
	validates :color, presence: true, length: { maximum: 255 }
end
