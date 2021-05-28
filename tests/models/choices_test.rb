require File.expand_path  '../../test_helper.rb', __FILE__


	class ChoicesTest < MiniTest::Unit::TestCase
		MiniTest::Unit::TestCase

		#se valida que un choice no puede tener un text vacio
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
		# una choice corresponde a un response
		# def test_choice_has_one_responses
		# 	question = Question.create(name:"pregunta",description:"¿que prefieres?",number:"1",type:"multiple choice")
		#	choice = Choice.create(text:'Option 1')
		#
		#	r = Response.create(choice_id: choice.id)
		#	assert_equal choice.response,r
		#end


  	end
