require 'sinatra'

post '/new_company' do
  @companies = params[:companies]
  erb :show
end

get '/new' do
  erb :new
end

