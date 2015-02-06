require 'active_record'

# setup the database connection
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database =>  "meter.db"
)

class Question < ActiveRecord::Base
  validates_presence_of :text
end

# ---

require 'sinatra'

enable :sessions


get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Question.all
  erb :index
end

post '/questions' do
  question = Question.new(text: params[:text])

  if question.save
    redirect '/questions'
  else
    session[:errors] = "question text is required"
  end
end

get '/questions/:id' do
  question = Question.find(params[:id])

  if question
    question.frequency += 1
    question.save

    {question: question.id, frequency: question.frequency}.to_json
  else

    {errors: "question id is invalid"}.to_json
  end

end

