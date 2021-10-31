require File.expand_path  '../../test_helper.rb', __FILE__

class ChoicesTest < MiniTest::Unit::TestCase
	def test_choice_has_one_response
        choice = Choice.create(text:'Option 1')

        response = Response.create(choice_id: choice.id)

        assert_equal choice.id, response.choice_id
    end
end