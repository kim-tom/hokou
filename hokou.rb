# coding: utf-8
require 'sinatra'
require 'active_record'

set :environment, :production
set :sessions,
expire_after: 7200,
secret: '7pfmkgzf2dz0otvznmly'

ActiveRecord::Base.establish_connection :production
class Hokou <ActiveRecord::Base
  self.table_name = "hokous"
end
class Account <ActiveRecord::Base
  self.table_name = "accounts"
end

get '/' do
  if(session[:login_flag]==true)
    @teacher=session[:teacher]
    @time = Time.now
    erb :contents
  else
    redirect '/login'
  end
end

get '/login' do
  erb :loginscr
end

post '/auth' do
  username=params[:uname]
  pass=params[:pass]
  if auth_check(username,pass)==1
    session[:login_flag]=true
    if username=="student"
      session[:teacher]=false
    end
    if username=="teacher"
      session[:teacher]=true
    end
    redirect '/'
  else
    session[:login_flag]=false
    redirect '/failure'
  end
end

get '/failure' do
  erb :failure
end

get '/hokous/:grade' do
  grade=params[:grade].to_i
  classes = Hokou.where(grade: grade)  #データベースから検索

  data={
    totalItems: classes.length,
    hokous: classes #配列で渡せる！
  }
  data.to_json
end

get '/logout' do
  session.clear
  erb :logout
end

post '/new' do
  if session[:teacher]
    h=Hokou.new
    h.grade=params[:grade].to_i
    h.dptmnt=params[:dptmnt]
    h.subject=params[:subject]
    h.teacher=params[:teacher]
    time=params[:date_ex_year]
    time=time+'/'
    time=time+params[:date_ex_month]
    time=time+'/'
    time=time+params[:date_ex_day]
    h.date_ex=time
    h.koma_ex=params[:koma_ex]
    time=params[:date_rest_year]
    time=time+'/'
    time=time+params[:date_rest_month]
    time=time+'/'
    time=time+params[:date_rest_day]
    h.date_rest=time
    h.koma_rest=params[:koma_rest]
    h.bikou=params[:bikou]
    h.save
    redirect '/'
  end
end

def auth_check(trial_username,trial_passwd)
  #serch recorded Information

  begin
    a=Account.find(trial_username)
    db_username=a.id
    db_salt=a.salt
    db_hashed=a.hashed
    db_algo=a.algo
  rescue =>e
    return 0
  end
  #generate a hashed value
  if db_algo=="1"
    trial_hashed =Digest::MD5.hexdigest(db_salt+trial_passwd)
  else
    return 0
  end
  if db_hashed==trial_hashed
    return 1
  else
    return 0
  end
end
