require File.expand_path  '../../test_helper.rb', __FILE__

class ResultCareerTest < MiniTest::Unit::TestCase
	def test_result_has_many_careers
        career = Career.create(name: 'El arte del fuchiboli')

        user = User.create(username: 'Boquita', dni: '2010939101')

        result = Result.create(user_id: user.id)

        results_careers = ResultCareer.create(result_id: result.id, career_id: career.id);

        result_user_id = Result.where(id: results_careers.result_id).first.user_id

        result_username = User.where(id: result_user_id).first.username

        assert_equal results_careers.career_id, career.id
        assert_equal results_careers.result_id, result.id
        assert_equal result_username, 'Boquita'
    end
end