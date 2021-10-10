require './models/init.rb'

class App < Sinatra::Base
  get '/' do
    erb :welcome_test
  end
  get '/normal_test' do
    erb :login_template
  end

  get '/make_survey' do
    @questions = Question.all

    @survey = Survey.create(username: params[:username])

    erb :survey_template
  end

  get '/careers_available' do
    @careers = Career.all

    erb :careers_available
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
  post '/create_user' do
    user = JSON.parse request.body.read

    User.create(username: user['username'], dni: user['dni'])

    { success: "Usuario #{user['username']} creado" }.to_json
  end
  #def saveUser(user)
  #  begin
      #checkCareerIsCreated(user)


     # { success: "Carrera #{career['name']} creada" }.to_json
    #rescue StandardError => e
    #  { error: e.message }.to_json
    #end
  #end

  post '/create_career' do
    career = JSON.parse request.body.read

    saveCarrer(career)
  end

  def saveCarrer(career)
    begin
      checkCareerIsCreated(career)

      Career.create(name: career['name'], link: career['link'])

      { success: "Carrera #{career['name']} creada" }.to_json
    rescue StandardError => e
      { error: e.message }.to_json
    end
  end

  def checkCareerIsCreated(careerToCreate)
    careers = Career.all

    careers.each do |career|
      if career.name == careerToCreate['name']
        raise "La carrera #{career.name} ya existe"
      end
    end
  end
end
