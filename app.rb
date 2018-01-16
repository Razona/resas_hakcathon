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
  @kuriValue = params[:kuriValue]
  @date = params[:date]
  History.create!(kuriId: params[:kuriId], userId: params[:userId],lat: params[:lat],lon: params[:lon],date: params[:date])
  User.create!(userId: params[:userId],lat: params[:lat],lon: params[:lon])
  redirect '/test'
end


get '/kuri.json' do
    content_type :json, :charset => 'utf-8'
    histories = History.all
    histories.to_json
    
end

get '/userData.json' do
    userId=params[:userId]
    
    histories = History.where(userId: userId).first
   #users = User.where({userId: userId)
   #users.to_json
   histories.to_json
end

post '/kuri'  do

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
  
      #users = User.new
     # users.userId = userId
     # users.lat = lat
     # users.lon =lon
      
      
    #  if kuriValue == nil
    #      kuriValue = 0
    #  end
     
     # histories.kuriValue = kuriValue + 1
     # histories.save
      
      #users.kuriValue = kuriValue+1
      #users.save 
      # logger.info users
      
    
    kuriId = History.where(kuriId: kuriId).first
    histories.kuriId = 0
    histories.save!
    
      
  # レスポンスコード
  status 200 

end

get '/test' do
    erb :test
end

get '/face' do
  # リクエスト解析
  reqData = JSON.parse(request.body.read.to_s) 
  faceId = reqData['faceId']
  top = reqData['top']
  left = reqData['left']
  width = reqData['width']
  height = reqData['height']
  anger = reqData['anger']
  contempt = reqData['contempt']
  disgust = reqData['disgust']
  fear = reqData['fear']
  happiness = reqData['happiness']
  neutral = reqData['neutral']
  sadness = reqData['sadness']
  surprise = reqData['surprise']
  
  

  # データ保存
  faces = History.new
  faces.faceId = faceId
  faces.top = top
  faces.left = left
  faces.width = width
  faces.height = height
  faces.anger = anger
  faces.contempt = contempt
  faces.disgust = disgust
  faces.fear = fear
  faces.happiness = happiness
  faces.neutral = neutral
  faces.sadness = sadness
  faces.surprise = surprise
  
  faces.save

  # レスポンスコード
  status 202  
end
