require "sinatra"
require "sinatra/activerecord"

require "./models"

set :database, "sqlite3:blogdb.sqlite3"

get '/' do
	@posts = Post.all
	erb :home
end	