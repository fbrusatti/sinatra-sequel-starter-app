require './models/init.rb'

class App < Sinatra::Base
  get '/' do
    erb :login_template
  end

  get "/hello/:name" do
   @name = params[:name]
   erb :hello_template
  end

  get "/show_careers" do
    @careers = Career.all

    erb :careers_template
  end

  post "/create_career" do
    career = Career.new(name:params[:name])

      if career.save
        [201,{'location' => "/show_careers"}, 'CREATED']
      else
        [500,{}, 'Internal Server Error']
      end
  end

  get "/finish_survey" do
    choicesSelected = params[:choices]

    # clearCache()

    # createResponsesFromChoices(choicesSelected)

    # points = getPoints();

    # results = getCareersWithPoints(points);

    choicesSelected.to_s
  end

  def clearCache()
    Response.all.each do |response|
      response.destroy
    end
  end

  def createResponsesFromChoices(choices)
    choices.each do |choice|
      Response.create(choice_id: choice['choiceId'].to_i, question_id: choice['questionId'].to_i)
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

  get '/make_survey' do
    @questions = Question.all

    @survey = Survey.create(username: params[:username])

    erb :survey_template
  end

  post "/posts" do
    request.body.rewind  # in case someone already read it
    data = JSON.parse request.body.read
    post = Post.new(description: data['desc'])
    if post.save
      [201, { 'Location' => "posts/#{post.id}" }, 'CREATED']
    else
      [500, {}, 'Internal Server Error']
    end
  end

  get '/posts' do
    p = Post.where(id: 1).last
    p.description
  end
end
