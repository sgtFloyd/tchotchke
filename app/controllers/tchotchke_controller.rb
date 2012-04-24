set :public_folder, 'public'

get '/' do
  haml :index
end

# convert sass files on the fly
get '/css/:file.css' do
  sass :"sass/#{params[:file]}"
end
