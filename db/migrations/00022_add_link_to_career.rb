Sequel.migration do
    up do
        alter_table(:careers) do
        add_column :link, String, default: ''
	end
    end

    down do
        drop_column :link, :careers
    end
end