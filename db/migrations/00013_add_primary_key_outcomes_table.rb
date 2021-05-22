Sequel.migration do
    up do
        alter_table(:outcomes) do
            add_primary_key :id
        end
    end

    down do
        drop_column :careers, :career_id
        drop_column :choices, :choice_id
    end
end