class AddIndexesToOrganizations < ActiveRecord::Migration[5.2]
  def up
    add_index :organizations, :data, using: :gin

    # Create per-field expression indexes
    execute <<-SQL
      CREATE UNIQUE INDEX data_id_index ON organizations ((data->>'id'));
      CREATE INDEX data_type_index ON organizations ((data->>'type'));
      CREATE INDEX data_name_index ON organizations ((data->>'name'));
      CREATE INDEX data_parent_index ON organizations ((data->>'parent'));
      CREATE INDEX data_organization_codes_index ON organizations ((data->>'organization_codes'));
    SQL
  end

  def down
    remove_index :organizations, column: :data
    remove_index :organizations, name: :data_id_index
    remove_index :organizations, name: :data_type_index
    remove_index :organizations, name: :data_name_index
    remove_index :organizations, name: :data_parent_index
    remove_index :organizations, name: :data_organization_codes_index
  end
end
