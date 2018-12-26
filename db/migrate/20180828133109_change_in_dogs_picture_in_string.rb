class ChangeInDogsPictureInString < ActiveRecord::Migration[5.2]
  def change
    change_column :dogs, :picture, :string
  end
end
