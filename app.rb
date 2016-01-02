require "sinatra"
require "sinatra/activerecord"

require "./models"

set :database, "sqlite3:blogdb.sqlite3"

get '/' do
	@posts = Post.all
	erb :home
end	

get '/sign_in' do
	erb :signin	
end	

post '/sign_in' do
	puts "my params are" + params.inspect

end	