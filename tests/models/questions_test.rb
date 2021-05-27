require File.expand_path  '../../test_helper.rb', __FILE__

	class QuestionTest < MiniTest::Unit::TestCase
		def test_question_has_many_choices
			question = Question.create(name:'question',description:'answer question',type:'logic')

			Choice.create(text: 'one', question_id: question.id)
			Choice.create(text: 'two', question_id: question.id)
			Choice.create(text: 'three', question_id: question.id)

			assert_equal(question.choices.count, 3)
		end
	end