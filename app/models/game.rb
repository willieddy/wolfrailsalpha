class Game < ActiveRecord::Base
	def self.update_game
	    @users = User.where(:dead => false).load

	    @game = Game.find(1) 

	    if @game.active 
	      	@time = Time.now 
	      	@game.night = !@game.night

		    if @time.hour % 2 == 0
		    	@userToKill = @users.order(:vote).first

		    	@userToKill.dead = true
		    	@userToKill.save
		    	@game.num_alive-=1

		    	if @userToKill.werewolf
		    		@game.num_were-=1
		    	else
		        	@game.num_town-=1
		    	end
		    end
		    
		    if @game.num_were == 0
		        finish
		    elsif @game.num_town == 0
		        finish
		    end
		 end

	    @game.save
	 end

end
