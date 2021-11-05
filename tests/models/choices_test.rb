require File.expand_path  '../../test_helper.rb', __FILE__

class ChoicesTest < MiniTest::Unit::TestCase
	def test_choices_must_has_text
		choice = Choice.new

		choice.text = ''

		assert_equal choice.valid?,false
	end

	def test_choices_has_many_outcome
		choice = Choice.create(text:'new_text')

		Outcome.create(choice_id: choice.id)
		Outcome.create(choice_id: choice.id)

		assert_equal(choice.outcomes.count, 2)
	end
end
