require './models/init'

# general class of project
class App < Sinatra::Base
  get '/' do
    erb :welcome_test
  end

  get '/careers_available' do
    @careers = Career.all

    erb :careers_available
  end

  post '/finish_survey' do
    data = JSON.parse request.body.read

    clear_cache

    create_responses_from_choices(data['choicesSelected'])

    points = getpoints

    careers_withpoints = getcareers_with_points(points)

    result = create_result_survey(data['user'], careers_withpoints)

    { result_id: result.id }.to_json
  end

  def clear_cache
    Response.all.each do |response|
      response.destroy
    end
  end

  def create_responses_from_choices(choices)
    choices.each do |choice|
      Response.create(
        choice_id: choice['choiceId'],
        question_id: choice['questionId']
      )
    end
  end

  def getpoints
    outcomes = Outcome.all
    responses = Response.all

    careers_points = {}

    responses.each do |response|
      outcomes.each do |outcome|
        careers_points[outcome.career_id] = careers_points[outcome.career_id].to_i + 1 if outcome.choice_id == response.choice_id
      end
    end

    careers_points
  end

  def getcareers_with_points(careers_points)
    careers = Career.all

    results = []

    careers_points.each do |key, points|
      careers.each do |career|
        next unless key == career.id

        results.push(
          { career_id: career.id, name: career.name, points: points }
        )
      end
    end

    results
  end

  def create_result_survey(user, careers_withpoints)
    user = User.where(dni: user['dni']).first

    result = Result.create(user_id: user.id)

    careers_withpoints.map do |career_withpoint|
      ResultCareer.create(
        result_id: result.id,
        career_id: career_withpoint[:career_id],
        career_points: career_withpoint[:points]
      )
    end

    result
  end

  get '/show_survey' do
    @results = ResultCareer.where(result_id: params[:result_id]).all

    careers_ids = @results.map { |result| result[:career_id] }

    @careers = Career.where(id: careers_ids).all

    result = Result.where(id: params[:result_id]).first

    @user = User.where(id: result[:user_id]).first

    erb :result_survey
  end

  get '/sign_up' do
    @login_type = 'sign_up'

    erb :login_template
  end

  get '/sign_in' do
    @login_type = 'sign_in'

    erb :login_template
  end

  post '/get_career_score' do
    career_select = JSON.parse request.body.read

    count = 0

    ResultCareer.all.each do |career|
      count += 1 if career.career_id == career_select['careerId'].to_i
    end

    { career_score: count }.to_json
  end

  get '/complete_sign_up' do
    if User.where(dni: params[:dni]).first
      @error = "El usuario con DNI #{params[:dni]} ya existe"

      erb :error_page

    else
      User.create(username: params[:username], dni: params[:dni], password: params[:password])

      @login_type = 'sign_in'

      erb :login_template
    end
  end

  get '/complete_sign_in' do
    user = User.where(dni: params[:dni]).first

    if !user
      @error = "El usuario con DNI #{params[:dni]} no existe"

      erb :error_page

    elsif user.password != params[:password]
      @error = 'Password incorrecta'

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

    save_carrer(career)
  end

  def save_carrer(career)
    check_career_is_created(career)

    Career.create(name: career['name'], link: career['link'])

    { success: "Carrera #{career['name']} creada" }.to_json
  rescue StandardError => e
    { error: e.message }.to_json
  end

  def check_career_is_created(career_to_create)
    careers = Career.all

    careers.each do |career|
      raise "La carrera #{career.name} ya existe" if career.name == career_to_create['name']
    end
  end
end
