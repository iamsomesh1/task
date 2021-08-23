class Article < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	scope :desce, -> { order("created_at DESC") }

	validates :title, presence: true
 	validates :body, presence: true, length: { minimum: 10 }
	#validates :author, presence: true
end
