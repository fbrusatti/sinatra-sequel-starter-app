Sequel.migration do
  up do
    create_table(:responses) do
      
    end
  end

  down do
    drop_table(:posts)
  end
end
