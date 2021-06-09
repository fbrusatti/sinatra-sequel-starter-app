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

  post "/make_survey/finish" do
    params = JSON.parse request.body.read

    Response.all.each do |response|
      response.destroy
    end

    params.each do |data|
      newResponse = Response.new(choice_id: data['choiceId'], question_id: data['questionId'])

      newResponse.save
    end

    outcomes = Outcome.all
    responses = Response.all

    results = []

    responses.each do |response|
      outcomes.each do |outcome|
        if outcome.choice_id == response.choice_id
            results.push(outcome.career_id)
        end
      end
    end

    results.to_s
  end

  get '/make_survey' do
    @questions = Question.all
    @newSurvey = Survey.create(username: params[:username])
    erb :survey_template

    #params[:username]
    #survey = Survey.new(username:params[:username])

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
