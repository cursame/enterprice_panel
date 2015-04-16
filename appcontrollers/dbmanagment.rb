configure :development do
ActiveRecord::Base.establish_connection(
  :adapter     => "sqlite3",
  :database    => "./data.sqlite3",
  :pool        => 1,
  :timeout     => 5000,
  :datetime    => "timestamp with time zone" ,
  :timestamp   => "timestamp with time zone" 
)
end
configure :production do
ActiveRecord::Base.establish_connection(
  :adapter     => "postgresql",
  :host        => "ec2-107-22-166-233.compute-1.amazonaws.com",
  :database    => "d1qjvnlkr2nchf",
  :user        => "xfstixpuqpcziu",
  :password    => "avJTTKiK7LrBKssND5U-0GCuwK",
  :pool        => 1,
  :timeout     => 5000,
  :port        => 5432,
  :datetime    => "timestamp with time zone" ,
  :timestamp   => "timestamp with time zone" 
)
end

####### methodos de usuarios #######

class User < ActiveRecord::Base
	######## checkins #########
	def check_ins 
		check_ins = CheckIn.where(token_user: self.token_user)
	end
    ######## checkins activos ########
    def actives_check
    	arr = []
    	self.check_ins.each do |chi|
    		if chi.activect == true
    			arr.push(chi.id)
    	    end
    	end
        check_ins.find(arr)
    end
    ###### retardos ######
	def works_delay
		i = 0
		self.actives_check.each do |check|
			if check.hour.to_i > 10 && check.hourmin.to_i < 1018
               i = i + 1
			end
		end
		i
    end

    ##### faltas #######

    def faults
    	i = 0
		self.actives_check.each do |check|
			if check.hourmin.to_i > 1018
               i = i + 1
			end
		end
		i
    end 
end

############# controlador

require './appcontrollers/dbmethods/users_controller'


####### methodos de chequeo #########

class CheckIn < ActiveRecord::Base
   ######## zona horaria local valle de mexico ######
   def time_zone_mex
   	 self.check_in - 5.hours
   end
   ####### hora de creacion ######
   def hour
   	 self.time_zone_mex.strftime('%k')
   end
   ####### hora y minuto #####
   def hourmin
     self.time_zone_mex.strftime('%k'+'%M')
   end
   ######## activo ######
   def activect
   	 if montcomp == self.time_zone_mex.strftime('%m')
   	 	@ht = true
   	 else
   	 	@ht = false
   	 end
     @ht
   end
   ######## mes de comparacion #######
   def montcomp
   	 today = Time.now
   	 today.strftime('%m')
   end
end
############# controlador

require './appcontrollers/dbmethods/check_ins_controller'





