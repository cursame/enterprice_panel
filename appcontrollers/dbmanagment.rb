
ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => "./data.sqlite3",
  :pool => 1,
  :timeout => 5000
)

####### methodos de usuarios #######

class User < ActiveRecord::Base
end

require './appcontrollers/dbmethods/users_controller'


####### methodos de chequeo #########

class CheckIn < ActiveRecord::Base
end

require './appcontrollers/dbmethods/check_ins_controller'





