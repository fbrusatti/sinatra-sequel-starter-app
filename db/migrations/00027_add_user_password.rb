Sequel.migration do
    up do
        add_column :users, :password, String
    end

    down do
        drop_column :users, :password
    end
end