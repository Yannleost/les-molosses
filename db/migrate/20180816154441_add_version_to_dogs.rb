class AddVersionToDogs < ActiveRecord::Migration[5.2]
  def change
  add_column :dogs, :version, :string
  end
end
