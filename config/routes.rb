set :public_folder, 'public'

get '/' do
  haml :index
end

get '/css/:file.css' do
  sass :"sass/#{params[:file]}"
end

get '/load' do
  pass unless request.xhr?
  "Loaded!"
end