class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :trade
end
