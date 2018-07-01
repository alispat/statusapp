class Group < ApplicationRecord
	has_many :components, dependent: :restrict_with_exception
	validates :name, presence: true, length: { maximum: 255 }
end
