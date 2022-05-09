Sequel.migration do
    up do
        alter_table(:outcomes) do
            add_primary_key :id
        end
    end

    down do
    end
end