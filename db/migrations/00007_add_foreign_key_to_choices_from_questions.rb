Sequel.migration do
  up do
    alter_table(:choices) do
      add_foreign_key :question_number, :questions

    end
  end

  down do
    drop_column :questions, :question_number
  end
end
