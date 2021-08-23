class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  accepts_nested_attributes_for :profile
  after_update :welcome_email
  def welcome_email
    if self.confirmed_at?
    PostMailer.welcome_email(self).deliver
    end
  end
end
