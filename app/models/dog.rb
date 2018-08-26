class Dog < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :likes
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :picture, PhotoUploader
 end