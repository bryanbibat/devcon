class AddDirectionsToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :directions, :text
  end
end
