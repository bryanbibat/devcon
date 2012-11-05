class ChangeParticipantToResource < ActiveRecord::Migration
  def change
    remove_index :participants, :entity_id
    rename_column :participants, :entity_id, :resource_person_id
    add_index :participants, :resource_person_id
    add_column :participants, :custom_description, :text
    add_column :participants, :custom_title, :string
  end
end
