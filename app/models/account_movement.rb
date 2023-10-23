class AccountMovement < ApplicationRecord
  validates :montant, presence: true
  validates :movement_type, presence: true
  validates :client_id, presence: true

  belongs_to :client
end
