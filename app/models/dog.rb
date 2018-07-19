class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings , dependent: :destroy
  has_many :likes
  mount_uploader :photo, PhotoUploader
end
