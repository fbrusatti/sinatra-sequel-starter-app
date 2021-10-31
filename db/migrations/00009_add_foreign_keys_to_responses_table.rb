Sequel.migration do
  up do
    alter_table(:responses) do

      add_foreign_key :question_number, :questions
      add_foreign_key :choice_id, :choices
      add_foreign_key :survey_number, :surveys

    end
  end

  down do
    drop_column :questions, :question_number
    drop_column :choices, :choice_id
    drop_column :surveys, :survey_number
  end
end