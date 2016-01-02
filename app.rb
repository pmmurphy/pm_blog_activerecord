require "sinatra"
require "sinatra/activerecord"

require "./models"

set :database, "sqlite3:blogdb.sqlite3"

get '/' do
	Post.create(title:"Dog Park", body: "This is a post")
	@posts = Post.all
	erb :home
end	

get '/post' do
	@last_post = Post.last
	erb :post_page
end

get '/sign_in' do
	erb :signin	
end	

post '/sign_in' do
	puts "my params are" + params.inspect

end	