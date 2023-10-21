class AccountMovement < ApplicationRecord
  validates :montant, presence: true
  validates :movement_type, presence: true
end
