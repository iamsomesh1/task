class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  
  has_many :replies, dependent: :destroy
  validates :body, presence: true
end
