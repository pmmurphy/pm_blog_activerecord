require "sinatra"
require "sinatra/activerecord"

require "./models"

set :database, "sqlite3:blogdb.sqlite3"

enable :sessions



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
	@user = User.where(fname: params[:fname]).first

		if @user && @user.password == params[:password]
			session[:user_id] =@user.id
			redirect '/'
		else
			redirect '/login-failed'
	end
end	
		
get '/login-failed' do	
	"Oh No Something is Wrong. Please Try Again!"

end	