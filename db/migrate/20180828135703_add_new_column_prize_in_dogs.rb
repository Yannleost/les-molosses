class AddNewColumnPrizeInDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :prize, :boolean
  end
end
