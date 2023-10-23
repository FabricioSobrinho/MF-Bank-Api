# frozen_string_literal: true

class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  before_create :generate_acc_number
  before_validation :set_uid

  after_create :create_default_balance

  has_many :account_movements, dependent: :destroy

  private
  def generate_acc_number
    numbers = (1..9).to_a.shuffle[0, 8].map(&:to_s)
    self.acc_number = numbers.join
  end

  def create_default_balance
    Balance.create(user_balance: 0, client_id: self.id)
  end

  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end

  include DeviseTokenAuth::Concerns::User
end
