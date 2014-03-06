class UserMock
	attr_reader :name, :email

	def initialize(id)
		@name = "Prename#{id} Surname#{id}"
		@email = "user#{id}@example.com"
	end
end

class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
		# comment this out once DB is set up
		@user = User.find(params[:id])
		#@user = UserMock.new(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to VapeRater!"
			redirect_to @user
		else
			flash[:error] = "Invalid entry. Try again."
			render 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password,
			:password_confirmation)
	end
end
