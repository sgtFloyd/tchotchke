set :public_folder, 'public'

get '/' do
  haml :index
end

# convert sass files on the fly
get '/css/:file.css' do
  sass :"sass/#{params[:file]}"
end

# Artist, Album, Track Searching
get '/art/:artist' do
  pass unless request.xhr?
  sleep 3
  "> Artist Result!"
end

get '/alb/:album' do
  pass unless request.xhr?
  sleep 1
  "> Album Result!"
end

get '/tra/:track' do
  pass unless request.xhr?
  sleep 2
  "> Track Result!"
end