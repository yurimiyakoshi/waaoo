ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")
class Contribution < ActiveRecord::Base
  has_many :comments
  has_many :textbooks
  has_many :professors
  has_many :user_lectures
  has_many :attendances
  has_many :reminders
  has_many :users, :through => :user_lectures
  belongs_to :university
  belongs_to :professors
end

class Comment < ActiveRecord::Base
  belongs_to :contribution
  belongs_to :user
end

class Textbook < ActiveRecord::Base
  belongs_to :contribution
end

class Professor < ActiveRecord::Base
  belongs_to :contribution
  has_many :contributions
end

class User < ActiveRecord::Base
  has_secure_password
  has_many :user_lectures
  has_many :comments
  has_many :attendances
  has_many :reminders
  has_many :contributions, :through => :user_lectures
  belongs_to :university
end

class UserLecture < ActiveRecord::Base
  belongs_to :contribution
  belongs_to :user
  has_many :attendances
  has_many :reminders
end

class Attendance < ActiveRecord::Base
  belongs_to :contribution
  belongs_to :user
  belongs_to :user_lecture
end

class University < ActiveRecord::Base
  has_many :users
  has_many :contributions
end

class Reminder < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_lecutre
  belongs_to :contribution
end

 