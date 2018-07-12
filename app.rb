require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './models/contribution.rb'

enable :sessions

helpers do
    def current_user
        User.find(session[:user])
    end
end

# ログインページ
get '/top' do
    erb :sign_in
end

# 新規登録するとき
get '/signup' do
    erb :sign_up
end

# ログイン
post '/top' do
  user = User.find_by(user_name: params[:user_name])
  if user && user.authenticate(params[:password])
    session[:user] = user.id
  end
  redirect '/'
end

# 新規登録
post '/signup' do
  if University.find_by({school: params[:school]}).nil?
     @school = University.create(
      school: params[:school]
      )
    if @school.persisted?
       university_id = @school.id
    end
  else
  university_id = University.find_by({school: params[:school]}).id
  end
  @user = User.create(
      user_name: params[:user_name],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      university_id: university_id
      )
  if @user.persisted?
    session[:user] = @user.id
    if User.find_by({major: params[:major]}).nil?
     User.create(
      major: params[:major]
      )
    else
    current_user.major = User.find_by({major: params[:major]}).major
  end
  end
  @user_lecture = UserLecture.create(
      user_id: session[:user]
      )
  @attendance = Attendance.create(
      user_id: session[:user]
      )
  @count = Count.create(
      user_id: session[:user]
      )
  redirect '/'
end

# ログアウト
get '/signout' do
  session[:user] = nil
  redirect '/'
end

# 授業一覧トップページ(授業名＋場所＋出欠)
get '/' do
#  1限月〜土
 unless UserLecture.where(user_id: session[:user], date: "月", number: "1").nil?
    @m1_lessons = UserLecture.where(user_id: session[:user], date: "月", number: "1").pluck(:contribution_id)
  unless UserLecture.where(user_id: session[:user], date: "火", number: "1").nil?
     @t1_lessons = UserLecture.where(user_id: session[:user], date: "火", number: "1").pluck(:contribution_id)
   unless UserLecture.where(user_id: session[:user], date: "水", number: "1").nil?
      @w1_lessons = UserLecture.where(user_id: session[:user], date: "水", number: "1").pluck(:contribution_id)
    unless UserLecture.where(user_id: session[:user], date: "木", number: "1").nil?
       @th1_lessons = UserLecture.where(user_id: session[:user], date: "木", number: "1").pluck(:contribution_id)
     unless UserLecture.where(user_id: session[:user], date: "金", number: "1").nil?
        @f1_lessons = UserLecture.where(user_id: session[:user], date: "金", number: "1").pluck(:contribution_id)
      unless UserLecture.where(user_id: session[:user], date: "土", number: "1").nil?
         @s1_lessons = UserLecture.where(user_id: session[:user], date: "土", number: "1").pluck(:contribution_id)
# ２限月〜土
 unless UserLecture.where(user_id: session[:user], date: "月", number: "2").nil?
    @m2_lessons = UserLecture.where(user_id: session[:user], date: "月", number: "2").pluck(:contribution_id)
  unless UserLecture.where(user_id: session[:user], date: "火", number: "2").nil?
     @t2_lessons = UserLecture.where(user_id: session[:user], date: "火", number: "2").pluck(:contribution_id)
   unless UserLecture.where(user_id: session[:user], date: "水", number: "2").nil?
      @w2_lessons = UserLecture.where(user_id: session[:user], date: "水", number: "2").pluck(:contribution_id)
    unless UserLecture.where(user_id: session[:user], date: "木", number: "2").nil?
       @th2_lessons = UserLecture.where(user_id: session[:user], date: "木", number: "2").pluck(:contribution_id)
     unless UserLecture.where(user_id: session[:user], date: "金", number: "2").nil?
        @f2_lessons = UserLecture.where(user_id: session[:user], date: "金", number: "2").pluck(:contribution_id)
      unless UserLecture.where(user_id: session[:user], date: "土", number: "2").nil?
         @s2_lessons = UserLecture.where(user_id: session[:user], date: "土", number: "2").pluck(:contribution_id)
# ３限月〜土
 unless UserLecture.where(user_id: session[:user], date: "月", number: "3").nil?
    @m3_lessons = UserLecture.where(user_id: session[:user], date: "月", number: "3").pluck(:contribution_id)
  unless UserLecture.where(user_id: session[:user], date: "火", number: "3").nil?
     @t3_lessons = UserLecture.where(user_id: session[:user], date: "火", number: "3").pluck(:contribution_id)
   unless UserLecture.where(user_id: session[:user], date: "水", number: "3").nil?
      @w3_lessons = UserLecture.where(user_id: session[:user], date: "水", number: "3").pluck(:contribution_id)
    unless UserLecture.where(user_id: session[:user], date: "木", number: "3").nil?
       @th3_lessons = UserLecture.where(user_id: session[:user], date: "木", number: "3").pluck(:contribution_id)
     unless UserLecture.where(user_id: session[:user], date: "金", number: "3").nil?
        @f3_lessons = UserLecture.where(user_id: session[:user], date: "金", number: "3").pluck(:contribution_id)
      unless UserLecture.where(user_id: session[:user], date: "土", number: "3").nil?
         @s3_lessons = UserLecture.where(user_id: session[:user], date: "土", number: "3").pluck(:contribution_id)
# ４限月〜土
 unless UserLecture.where(user_id: session[:user], date: "月", number: "4").nil?
    @m4_lessons = UserLecture.where(user_id: session[:user], date: "月", number: "4").pluck(:contribution_id)
  unless UserLecture.where(user_id: session[:user], date: "火", number: "4").nil?
     @t4_lessons = UserLecture.where(user_id: session[:user], date: "火", number: "4").pluck(:contribution_id)
   unless UserLecture.where(user_id: session[:user], date: "水", number: "4").nil?
      @w4_lessons = UserLecture.where(user_id: session[:user], date: "水", number: "4").pluck(:contribution_id)
    unless UserLecture.where(user_id: session[:user], date: "木", number: "4").nil?
       @th4_lessons = UserLecture.where(user_id: session[:user], date: "木", number: "4").pluck(:contribution_id)
     unless UserLecture.where(user_id: session[:user], date: "金", number: "4").nil?
        @f4_lessons = UserLecture.where(user_id: session[:user], date: "金", number: "4").pluck(:contribution_id)
      unless UserLecture.where(user_id: session[:user], date: "土", number: "4").nil?
         @s4_lessons = UserLecture.where(user_id: session[:user], date: "土", number: "4").pluck(:contribution_id)
# ５限月〜土
 unless UserLecture.where(user_id: session[:user], date: "月", number: "5").nil?
    @m5_lessons = UserLecture.where(user_id: session[:user], date: "月", number: "5").pluck(:contribution_id)
  unless UserLecture.where(user_id: session[:user], date: "火", number: "5").nil?
     @t5_lessons = UserLecture.where(user_id: session[:user], date: "火", number: "5").pluck(:contribution_id)
   unless UserLecture.where(user_id: session[:user], date: "水", number: "5").nil?
      @w5_lessons = UserLecture.where(user_id: session[:user], date: "水", number: "5").pluck(:contribution_id)
    unless UserLecture.where(user_id: session[:user], date: "木", number: "5").nil?
       @th5_lessons = UserLecture.where(user_id: session[:user], date: "木", number: "5").pluck(:contribution_id)
     unless UserLecture.where(user_id: session[:user], date: "金", number: "5").nil?
        @f5_lessons = UserLecture.where(user_id: session[:user], date: "金", number: "5").pluck(:contribution_id)
      unless UserLecture.where(user_id: session[:user], date: "土", number: "5").nil?
         @s5_lessons = UserLecture.where(user_id: session[:user], date: "土", number: "5").pluck(:contribution_id)
# ６限月〜土
 unless UserLecture.where(user_id: session[:user], date: "月", number: "6").nil?
    @m6_lessons = UserLecture.where(user_id: session[:user], date: "月", number: "6").pluck(:contribution_id)
  unless UserLecture.where(user_id: session[:user], date: "火", number: "6").nil?
     @t6_lessons = UserLecture.where(user_id: session[:user], date: "火", number: "6").pluck(:contribution_id)
   unless UserLecture.where(user_id: session[:user], date: "水", number: "6").nil?
      @w6_lessons = UserLecture.where(user_id: session[:user], date: "水", number: "6").pluck(:contribution_id)
    unless UserLecture.where(user_id: session[:user], date: "木", number: "6").nil?
       @th6_lessons = UserLecture.where(user_id: session[:user], date: "木", number: "6").pluck(:contribution_id)
     unless UserLecture.where(user_id: session[:user], date: "金", number: "6").nil?
        @f6_lessons = UserLecture.where(user_id: session[:user], date: "金", number: "6").pluck(:contribution_id)
      unless UserLecture.where(user_id: session[:user], date: "土", number: "6").nil?
         @s6_lessons = UserLecture.where(user_id: session[:user], date: "土", number: "6").pluck(:contribution_id)
# １限月〜土
                end
               end
              end
             end
            end
           end
# ２限月〜土
                end
               end
              end
             end
            end
           end
# ３限月〜土           
                end
               end
              end
             end
            end
           end
# ４限月〜土           
                end
               end
              end
             end
            end
           end
# ５限月〜土           
                end
               end
              end
             end
            end
           end
# ６限月〜土           
                end
               end
              end
             end
            end
           end
    
    @count_units = Count.where(user_id: session[:user])
    @user_unit = @count_units.sum(:unit)
    erb :index 
end

# 授業追加ページ
get '/new_lecture' do
    erb :new_lecture
end

# 授業追加
post '/new' do
    name = params[:name]
    place = params[:place]
    teacher = params[:teacher]
    mail = params[:mail]
    uni_id = User.find(session[:user]).university_id
 if Contribution.find_by({name: name,place: place, university_id: uni_id}).nil?
    if Professor.find_by({teacher: teacher,mail: mail}).nil?
     lec = Professor.create({
           teacher: teacher,
           mail: mail
           })
      if lec.persisted?
        professor_id = lec.id
      end
    end
    professor_id = Professor.find_by({teacher: teacher,mail: mail}).id
    new = Contribution.create({
            name: name,
            place: place,
            professor_id: professor_id,
            university_id: uni_id
           })
    if new.persisted?
        contribution_id = new.id
    end
     Professor.create({
         contribution_id: contribution_id
     })
 end
    contribution_id = Contribution.find_by({name: name,place: place}).id
    user_lec = current_user.user_lectures.create({
               contribution_id: contribution_id,
               date: params[:date],
               number: params[:number]
               })
    if user_lec.persisted?
        user_lecture_id = user_lec.id
    end
    current_user.attendances.create({
        contribution_id: contribution_id,
        user_lecture_id: user_lecture_id
    })
    current_user.counts.create({
        unit: params[:unit],
        contribution_id: contribution_id,
        user_lecture_id: user_lecture_id
    })
    redirect '/' 
end

# 授業削除
post "/delete/:id" do
    UserLecture.find_by({
        contribution_id: params[:id]
    }).destroy
    Count.find_by({
        contribution_id: params[:id]
    }).destroy
    redirect '/'
end

# 科目ごとの詳細を表示する
get '/de/:id' do
    @content = Contribution.find(params[:id])
    @comments = @content.comments.all
    @textbooks = @content.textbooks.all
    @reminders = @content.reminders.all
    @professor = Professor.find_by({
        contribution_id: params[:id]
    })
    @attendance = Attendance.find_by({
        contribution_id: params[:id]
    })
    @count = Count.find_by({
        contribution_id: params[:id]
    })
    erb :detail
end

post '/comment/:id' do
    content = Contribution.find(params[:id])
    content.comments.create({
        sentence: params[:sentence]
    })
    redirect '/'
end

# 授業詳細ページ
post '/detail/:id' do
    content = Contribution.find(params[:id])
    content.update({
        name: params[:name],
        place: params[:place]
    })
    content.comments.create({
        sentence: params[:sentence]
    })
    content.textbooks.create({
        text: params[:text],
        text_url: params[:text_url]
    })
    content.reminders.create({
        report: params[:report],
        deadline: params[:deadline]
    })
    Professor.find_by({
        contribution_id: params[:id]
    }).update({
        teacher: params[:teacher],
        mail: params[:mail]
    })
    redirect '/'
end

# 遅刻数カウント
post '/number/:id' do
    attendance = Attendance.find_by(
        contribution_id: params[:id]
        )
    attendance.number = attendance.number + 1
    attendance.save
    redirect '/'
end

# 欠席数カウント
post '/absence/:id' do
    attendance = Attendance.find_by(
        contribution_id: params[:id]
        )
    attendance.absence = attendance.absence + 1
    attendance.save
    redirect '/'
end

# ユーザー編集
get '/edit_user/:id' do
    @user = User.find(params[:id])
    erb :user_edit
end

post '/renew_user/:id' do
    @user = User.find(params[:id])
    @user.update({
        user_name: params[:user_name],
        major: params[:major]
    })
    if University.find_by({school: params[:school]}).nil?
     @school = University.create(
      school: params[:school]
      )
      if @school.persisted?
       university_id = @school.id
      end
    else
      university_id = University.find_by({school: params[:school]}).id
    end
    @user.update({
        university_id: university_id
    })
    redirect '/'
end