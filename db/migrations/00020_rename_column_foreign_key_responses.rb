Sequel.migration do
    up do
    	alter_table(:responses) do
        rename_column :survey_number, :survey_id
        end
    end

    down do
      drop_column :survey_id, :surveys
    end
  end