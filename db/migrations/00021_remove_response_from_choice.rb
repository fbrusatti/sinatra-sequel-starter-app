Sequel.migration do
    up do
      alter_table(:choices) do
        drop_column :response_id
      end
    end
  
    down do
        add_foreign_key :response_id, :responses
    end
  end
  