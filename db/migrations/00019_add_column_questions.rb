Sequel.migration do
    up do
    	alter_table(:questions) do
  		add_column :number, Integer, default: 0
	end
    end

    down do
      drop_column :number, :questions
    end
  end