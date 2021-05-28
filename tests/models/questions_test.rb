require File.expand_path  '../../test_helper.rb', __FILE__

	class QuestionTest < MiniTest::Unit::TestCase
		def test_question_has_many_choices
			question = Question.create(name:'question',description:'answer question',type:'logic')

			Choice.create(text: 'one', question_id: question.id)
			Choice.create(text: 'two', question_id: question.id)
			Choice.create(text: 'three', question_id: question.id)

			assert_equal(question.choices.count, 3)
		end
		def test_question_has_many_responses
			question = Question.create(name:'question2',description:'answer question2',type:'numeric')

			Response.create(question_id: question.id)
			Response.create(question_id: question.id)
			Response.create(question_id: question.id)

			assert_equal(question.responses.count, 3)
		end

		def test_career_has_name_validator
			question = Question.new

			question.name = ''

			assert_equal question.valid?, false
		end

		# def test_career_has_description_validator
		#	question = Question.new
		#
		#	question.description = ''
		#
		#	assert_equal description.valid?, false
		#end





	end