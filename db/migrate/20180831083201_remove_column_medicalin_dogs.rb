class RemoveColumnMedicalinDogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :medical_analyse
  end
end
