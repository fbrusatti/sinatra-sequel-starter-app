require './models/init.rb'

class App < Sinatra::Base
  get '/' do
    "Hello World"
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

  get "/make_survey/finish" do
    @params = params
    erb :example_template
  end

  get '/make_survey' do
    @questions = Question.all

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
