class AddEyeColorToDogs < ActiveRecord::Migration[5.2]
  def change
  add_column :dogs, :eye_color, :integer
  end
end
