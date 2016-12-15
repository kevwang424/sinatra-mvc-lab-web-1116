require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    string = PigLatinizer.new
    answer = string.to_pig_latin(params[:user_phrase])
    "#{answer}"
  end

end
