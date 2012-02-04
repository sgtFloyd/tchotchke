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
  haml :results, locals: { type: :artist, results: Tchotchke::Artist.search(params[:artist]) }
end

get '/alb/:album' do
  pass unless request.xhr?
  haml :results, locals: { type: :album, results: Tchotchke::Album.search(params[:album]) }
end

get '/tra/:track' do
  pass unless request.xhr?
  haml :results, locals: { type: :track, results: Tchotchke::Track.search(params[:track]) }
end