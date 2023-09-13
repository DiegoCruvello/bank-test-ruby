class Transaction < ApplicationRecord
  belongs_to :sender_account
  belongs_to :recipient_account
end
