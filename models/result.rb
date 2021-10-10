class Result < Sequel::Model
	one_to_one :users
	one_to_many :careers
end