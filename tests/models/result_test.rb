require File.expand_path  '../../test_helper.rb', __FILE__

class ResultTest < MiniTest::Unit::TestCase
	def test_result_has_user
        user = User.create(username: 'Boquita', dni: '2010939101');

        result = Result.create(user_id: user.id)

        assert_equal result.user_id, user.id
    end
end