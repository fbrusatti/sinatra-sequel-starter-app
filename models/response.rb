class Response < Sequel::Model
	many_to_one :surveys

	one_to_one :choices

	many_to_one :questions
end
