class RemoveForeignKeyBookingFromReview < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :reviews, :booking, foreign_key: true
  end
end
