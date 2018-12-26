class ChangePhotoInAvatarAndPicturein2models < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :photo, :avatar
    rename_column :dogs, :photo, :picture
  end 
end 