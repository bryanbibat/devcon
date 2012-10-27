class AddFormalNameToEntity < ActiveRecord::Migration
  def change
    add_column :entities, :formal_name, :string
  end
end
