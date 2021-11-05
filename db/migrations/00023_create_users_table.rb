Sequel.migration do
  up do
    create_table(:users) do
      primary_key   :id
      String        :username
      String        :dni
      DateTime      :created_at,   default: Sequel::CURRENT_TIMESTAMP #este contempla la fecha que fue creado el objeto
      DateTime      :updated_at,   default: Sequel::CURRENT_TIMESTAMP #este contempla la ultima fecha que fue modificado
    end
  end

  down do
    drop_table(:users)
  end
end
