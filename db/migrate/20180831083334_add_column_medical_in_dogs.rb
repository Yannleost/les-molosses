class AddColumnMedicalInDogs < ActiveRecord::Migration[5.2]
  def change
     add_column :dogs, :medical_analyse, :boolean
  end
end
