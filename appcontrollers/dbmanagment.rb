
ActiveRecord::Base.establish_connection(
  :adapter     => "sqlite3",
  :database    => "./data.sqlite3",
  :pool        => 1,
  :timeout     => 5000,
  :datetime    => "timestamp with time zone" ,
  :timestamp   => "timestamp with time zone" 
)

####### methodos de usuarios #######

class User < ActiveRecord::Base
	def check_ins 
		@check_ins = CheckIn.where(token_user: self.token_user)
	end

    ###### retardos ######
	def works_delay
		i = 0
		self.check_ins.each do |check|
			if check.hour.to_i > 10 && check.hourmin.to_i < 1018
               i = i + 1
			end
		end
		i
    end

    ##### faltas #######

    def faults
    	i = 0
		self.check_ins.each do |check|
			puts check.hour
			if check.hourmin.to_i > 1018
               i = i + 1
			end
		end
		i
    end 
end

require './appcontrollers/dbmethods/users_controller'


####### methodos de chequeo #########

class CheckIn < ActiveRecord::Base
   def time_zone_mex
   	 self.check_in - 5.hours
   end

   def hour
   	 self.time_zone_mex.strftime('%k')
   end

   def hourmin
     self.time_zone_mex.strftime('%k'+'%M')
   end
end

require './appcontrollers/dbmethods/check_ins_controller'





