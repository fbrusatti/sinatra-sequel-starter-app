class Survey < Sequel::Model
	one_to_many :responses
end
