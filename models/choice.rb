class Choice < Sequel::Model
	many_to_one :questions

	one_to_many :outcomes

	one_to_one :response

  	def validate
    	super
    	errors.add(:text, 'cannot be empty') if !text || text.empty?
  	end
end
