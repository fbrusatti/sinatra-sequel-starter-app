Sequel.migration do
    up do
    	alter_table(:responses) do
        rename_column :question_number, :question_id
        end
    end
  
    down do
      drop_column :question_id, :questions
    end
  end
  