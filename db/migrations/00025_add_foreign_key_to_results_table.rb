Sequel.migration do
  up do
    alter_table(:results) do
    	add_foreign_key :user_id, :users
    end
  end
  down do
    drop_column :userses, :user_id
  end
end