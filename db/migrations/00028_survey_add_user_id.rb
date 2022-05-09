Sequel.migration do
    up do
        alter_table(:surveys) do
            add_foreign_key :user_id, :users
        end
    end

    down do
        drop_column :surveys, :user_id
    end
end