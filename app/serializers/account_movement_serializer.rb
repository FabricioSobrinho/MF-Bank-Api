class AccountMovementSerializer < ActiveModel::Serializer
  attributes :id, :montant, :sender, :movement_type, :created_at
end
