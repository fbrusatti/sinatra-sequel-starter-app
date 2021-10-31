Sequel.migration do
	up do
		create_table(:results) do
			primary_key   :id
			DateTime      :created_at,   default: Sequel::CURRENT_TIMESTAMP 
		end
	end

	down do
		drop_table(:results)
	end
	
end