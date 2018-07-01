class Config < ApplicationRecord
	validates :site, presence: true, length: { maximum: 255 }
	validates :url, length: { maximum: 255 }
	validates :description, length: { maximum: 255 }

	has_one_attached :logo
end
