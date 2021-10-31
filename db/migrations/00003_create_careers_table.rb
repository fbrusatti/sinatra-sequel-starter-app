Sequel.migration do
  up do
    create_table(:careers) do
      primary_key   :id
      String        :name
      DateTime      :created_at,   default: Sequel::CURRENT_TIMESTAMP #este contempla la fecha que fue creado el objeto
      DateTime      :updated_at,   default: Sequel::CURRENT_TIMESTAMP #este contempla la ultima fecha que fue modificado
    end
  end

  down do
    drop_table(:careers)
  end
end
