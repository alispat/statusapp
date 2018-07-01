class Template < ApplicationRecord
	validates :name, presence: true, length: { maximum: 255 }
  validates :message, presence: true
end