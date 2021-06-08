require './models/init.rb'

class App < Sinatra::Base
  get '/' do
    redirect :Main
  end
  
  
  get '/Main' do
    erb :landing
  end


  post "/careers" do
    career = Career.new(name: params[:name])

    if career.save
      [201, { 'Location' => "careers/#{career.id}" }, 'CREATED']
      redirect :careers
    else
      [500, {}, 'Internal Server Error']
    end
  end


  get "/careers" do
    @careers = Career.all
    erb :careers_index
  end


  get "/careers/:id" do
    @career = Career.find(id: params[:id])
    erb :info_career_index 
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

  get '/vocational_test' do
    erb :test_index
  end


  post '/surveys' do    
    survey = Survey.new(username: params[:name])

    if survey[:username]
      [201, {}, 'Username vacio']   
      redirect :careers
    end

    if survey.save
      [201, { 'Location' => "surveys/#{survey.id}" }, 'User created sucesfully'] 
      #sleep(4)
      redirect :vocational_test
    else
      [504, {}, 'Internal server error']
    end
  end


  get "/surveys" do
    @surveys = Survey.all
    erb :info_survey_index 
  end
end

