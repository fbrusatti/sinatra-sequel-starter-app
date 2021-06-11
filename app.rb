require './models/init.rb'

class App < Sinatra::Base
  get '/' do
    erb :login_template
  end

  get '/make_survey' do
    @questions = Question.all

    @survey = Survey.create(username: params[:username])

    erb :survey_template
  end

  post "/finish_survey" do
    choicesSelected = JSON.parse request.body.read

    clearCache()

    createResponsesFromChoices(choicesSelected)

    points = getPoints();

    results = getCareersWithPoints(points);

    results.to_json
  end

  def clearCache()
    Response.all.each do |response|
      response.destroy
    end
  end

  def createResponsesFromChoices(choices)
    choices.each do |choice|
      Response.create(choice_id: choice['choiceId'], question_id: choice['questionId'])
    end
  end

  def getPoints()
    outcomes = Outcome.all
    responses = Response.all

    careersPoints = {}

    responses.each do |response|
      outcomes.each do |outcome|
        if outcome.choice_id == response.choice_id
            careersPoints[outcome.career_id] = careersPoints[outcome.career_id].to_i + 1
        end
      end
    end

    return careersPoints
  end

  def getCareersWithPoints(careersPoints)
    careers = Career.all

    results = []

    careersPoints.each do |key, points|
      careers.each do |career|
        if key == career.id
          results.push({career_id: career.id, name: career.name, points: points})
        end
      end
    end

    return results
  end

  get '/show_survey' do
    @results = JSON.parse params[:results]

    @username = params[:username]

    erb :result_survey
  end
end
