class RemoveColumnPrizeInDogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :prize
  end
end
