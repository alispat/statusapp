class Component < ApplicationRecord
  belongs_to :group
  belongs_to :situation
  has_many :events, dependent: :destroy

  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  validates :name, presence: true, length: { maximum: 255 }
  validates :url, length: { maximum: 255 }
  validates :description, length: { maximum: 255 }

  def self.everything_ok?
    not_operational = Component.where('situation_id > ?',Situation.all.first.id).first
    ok = true
    ok = false if not_operational
    ok
  end

end
