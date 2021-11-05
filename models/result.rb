class Result < Sequel::Model
	one_to_one :users
	many_to_many :careers
end