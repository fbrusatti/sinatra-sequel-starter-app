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
    # aca logro acomodar de menor a mayor 
    @resultOrdered = @results.sort_by do |r|
      r["points"]
    end
    saveResultCareerTop(@resultOrdered)
    @username = params[:username]
    @careers = Career.all

    erb :result_survey
  end

  post '/get_result_careers' do 
    careerSelect = JSON.parse request.body.read
    fechaInicio = careerSelect['startDate']
    fechaFin = careerSelect['endDate']
    resultCareers = ResultCareer.all
    aux = careerSelect['idCareer']
    count = 0
    

    resultCareers.each do |career|
      if career.career_id == aux
       count = count + 1
      end
    end   
    
    { quantity: count}.to_json
  
  end


  def saveResultCareerTop( careersResult )
    begin
      #I get the race with the most points
      topCareerPoint = careersResult[ (careersResult.length()) - 1]
      
      career_id = Career.where(name: topCareerPoint['name']).first.id

      # aca vamos a tener que chequear la forma de obtener el user_id sin hardcodearlo
      result =  Result.create(user_id: 1)
      result_id = Result.where(user_id: 1 ).first.user_id
      
      ResultCareer.create(result_id:result_id, career_id:career_id, career_points:topCareerPoint['points'])

      careersResult.delete_at((careersResult.length()) - 1)

      careersResult.each do |iterator|
        if iterator['points'] == topCareerPoint['points']
          career_id = Career.where(name: iterator['name']).first.id
          result_id = Result.where(user_id: 1 ).first.user_id
          ResultCareer.create(result_id:result_id, career_id:career_id, career_points:topCareerPoint['points'])
        end  
      end

    end
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
