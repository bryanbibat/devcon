class AddShortNameToEntity < ActiveRecord::Migration
  def change
    add_column :entities, :short_name, :string
  end
end
