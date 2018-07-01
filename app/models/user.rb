class User < ApplicationRecord

  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :async, :registerable, :timeoutable,
         :recoverable, :trackable, :validatable

  has_many :subscriptions, dependent: :destroy
  has_many :components, through: :subscriptions

  before_validation :define_public_token, on: :create

protected

  def password_required?
    return false
  end

  # before_validation on create
  def define_public_token
    self.public_token = SecureRandom.uuid if public_token.blank?
  end

end
