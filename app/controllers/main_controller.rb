class MainController < ApplicationController

	def index
		session.init target: rand(1..100), tries: 0
	end

	def compare
		@guess = params[:guess].to_i
		session[:tries] += 1
		if @guess == session[:target]
			@num = session[:target]
			@tries = session[:tries]
			render "correct"
			session.clear
		else
			@hilo = @guess > session[:target] ? "high" : "low"
			render "tryagain"
		end
	end

end