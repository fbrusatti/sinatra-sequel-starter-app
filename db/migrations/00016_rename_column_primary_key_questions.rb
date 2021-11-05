Sequel.migration do
    up do
    	alter_table(:questions) do
        rename_column :number, :id
        end
    end
  
    down do
      drop_column :id, :questions
    end
  end
  