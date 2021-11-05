Sequel.migration do
  up do
    alter_table(:outcomes) do

      add_foreign_key :career_id, :careers
      add_foreign_key :choice_id, :choices

    end
  end

  down do
    drop_column :careers, :career_id
    drop_column :choices, :choice_id
  end
end