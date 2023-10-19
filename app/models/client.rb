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

  private
  def generate_acc_number
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    self.acc_number = ''
    while self.acc_number.length < 8
      self.acc_number += numbers.sample.to_s
    end
  end

  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end

  include DeviseTokenAuth::Concerns::User
end
