class Profile < ApplicationRecord
	has_one_attached :image,dependent: :destroy
	belongs_to :user
	validates :name, presence: true
	validates :dob, presence: true
	validates :address, presence: true
	validates :image, presence: true
end
