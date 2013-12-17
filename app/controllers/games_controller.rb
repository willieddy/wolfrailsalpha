class GamesController < ApplicationController
	before_action :admin_user, only: [:create, :destroy]

	def new
		@game = Game.find_by_id(1)

		if !@game
			@game = Game.new
			@game.active = :true
			@game.night = :true
			@game.num_alive = User.where(:dead => false).all.count

			@users = User.all
			@users = @users.shuffle!

			@numWere = @users.count/5

			@game.num_were = @numWere
			@game.num_town = @game.num_alive - @game.num_were

			(0..@numWere).each do |i|
				@user = @users[i]
				@user.werewolf = true
		end

		if @game.save
			flash[:success] = "ID: " + @game.id.to_s
			render 'admin'
		else
			flash[:error] = "Error with creating game"
		end
	end

	def finish
		@game = Game.find_by_id(1)
		game.active = false
	end

	def destroy
		@game = Game.find_by_id(1)
		game.active = false
	end
end
