class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.jsonb :data

      t.timestamps
    end
  end
end
