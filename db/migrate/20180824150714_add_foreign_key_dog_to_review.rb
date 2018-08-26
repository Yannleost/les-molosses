class AddForeignKeyDogToReview < ActiveRecord::Migration[5.2]
  def change
  	add_reference :reviews, :dog, foreign_key: true
  end
end
