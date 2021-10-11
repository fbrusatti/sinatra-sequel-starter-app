Sequel.migration do
	up do
		create_table(:result_careers) do
			primary_key   :id
			foreign_key   :result_id, :results
			foreign_key   :career_id, :careers
			Int           :career_points
			DateTime      :created_at,   default: Sequel::CURRENT_TIMESTAMP
		end
	end

	down do
		drop_table(:result_careers)
	end
end