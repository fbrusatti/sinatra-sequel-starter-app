class Career < Sequel::Model
	one_to_one :survey

	one_to_many :outcomes
end
