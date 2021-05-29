require File.expand_path  '../../test_helper.rb', __FILE__


	class SurveysTest < MiniTest::Unit::TestCase
	  MiniTest::Unit::TestCase

			#se valida que un survey no puede tener un text vacio
	  def test_surveys_must_has_username
	 	survey = Survey.new
		survey.username = ''
		assert_equal survey.valid?,false

	  end

	  def test_survey_has_many_responses
		survey = Survey.create(username:'usuario')

		Response.create(survey_id: survey.id)
		Response.create(survey_id: survey.id)
		Response.create(survey_id: survey.id)

		assert_equal(survey.responses.count, 3)

	  end

	end