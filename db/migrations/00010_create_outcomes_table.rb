Sequel.migration do
  up do
    create_table(:outcomes) do
      
          end
  end

  down do
    drop_table(:posts)
  end
end
