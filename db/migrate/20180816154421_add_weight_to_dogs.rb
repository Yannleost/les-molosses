class AddWeightToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :weight, :integer
  end
end
