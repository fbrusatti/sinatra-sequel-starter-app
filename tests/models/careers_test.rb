require File.expand_path  '../../test_helper.rb', __FILE__


	class CareerTest < MiniTest::Unit::TestCase
		def test_career_has_many_surveys
			career = Career.create(name:'Spaceman')

			Survey.create(username: 'U1', career_id: career.id)
			Survey.create(username: 'U2', career_id: career.id)
			Survey.create(username: 'U3', career_id: career.id)

			assert_equal(career.survey.count, 3)
		end
	end