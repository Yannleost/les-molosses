class Dog < ApplicationRecord

  belongs_to :user
  acts_as_votable
  has_many :likes
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  mount_uploader :picture, PhotoUploader
 end
