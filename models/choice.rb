class Choice < Sequel::Model
	many_to_one :questions

	one_to_many :outcomes

	one_to_one :responses
end
