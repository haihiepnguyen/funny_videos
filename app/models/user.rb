class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :videos
  accepts_nested_attributes_for :videos, allow_destroy: true
  has_many :user_videos
  has_many :shared_videos, through: :user_videos
end
