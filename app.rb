require './models/init.rb'

class App < Sinatra::Base
  get '/' do
    erb :welcome_test
  end

  get '/careers_available' do
    @careers = Career.all

    erb :careers_available
  end

  post "/finish_survey" do
    data = JSON.parse request.body.read

    clearCache()

    createResponsesFromChoices(data['choicesSelected'])

    points = getPoints();

    careersWithPoints = getCareersWithPoints(points);

    result = createResultSurvey(data['user'], careersWithPoints);

    { result_id: result.id }.to_json
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

  def createResultSurvey(user, careersWithPoints)
    user = User.where(dni: user['dni']).first;

    result = Result.create(user_id: user.id)

    careersWithPoints.each do |careerWithPoint|
      ResultCareer.create(
        result_id: result.id,
        career_id: careerWithPoint['career_id'],
        career_points: careerWithPoint['points']
      )
    end

    return result
  end

  get '/show_survey' do
    results = ResultCareer.where(result_id: params[:result_id]).all

    results.inspect

  end

  get '/sign_up' do
    @loginType = 'sign_up'

    erb :login_template
  end

  get '/sign_in' do
    @loginType = 'sign_in'

    erb :login_template
  end

  get '/complete_sign_up' do
    if User.where(dni: params[:dni]).first
      @error = "El usuario con DNI #{params[:dni]} ya existe"

      erb :error_page

    else
      User.create(username: params[:username], dni: params[:dni], password: params[:password])

      @loginType = 'sign_in'

      erb :login_template
    end
  end

  get '/complete_sign_in' do
    user = User.where(dni: params[:dni]).first;

    if !user
      @error = "El usuario con DNI #{params[:dni]} no existe"

      erb :error_page

    elsif user.password != params[:password]
      @error = "Password incorrecta"

      erb :error_page

    else
      @questions = Question.all

      @survey = Survey.create(user_id: user.id)

      @user = user

      erb :survey_template
    end
  end

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
