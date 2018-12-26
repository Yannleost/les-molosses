class ChangeEyeColorToBeStringInDogs < ActiveRecord::Migration[5.2]
  def change
    change_column :dogs, :eye_color, :string
  end
end
