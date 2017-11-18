require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'sinatra/activerecord'
require './models'
require 'json'


get '/list' do
    erb :list
end

post '/db_save' do
  @kuriId = params[:kuriId]
  @userId = params[:userId]
  @lat = params[:lat]
  @lon = params[:lon]
  @date = params[:date]
  History.create!(kuriId: params[:kuriId], userId: params[:userId],lat: params[:lat],lon: params[:lon],date: params[:date])
  redirect '/test'
end


get '/kuri.json' do
    content_type :json, :charset => 'utf-8'
    histories = History.all
    histories.to_json
end

post '/kuri' do
  # リクエスト解析
  reqData = JSON.parse(request.body.read.to_s) 
  kuriId = reqData['kuriId']
  userId = reqData['userId']
  lat = reqData['lat']
  lon = reqData['lon']
  date = reqData['date']
  
  

  # データ保存
  histories = History.new
  histories.kuriId = kuriId
  histories.userId = userId
  histories.lat = lat
  histories.lon =lon
  histories.date = date
  histories.save

  # レスポンスコード
  status 202  
end

get '/test' do
    erb :test
end