class AddCoverPhotoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :cover_photo, :string
  end
end
