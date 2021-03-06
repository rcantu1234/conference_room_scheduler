class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

def index
  @current_page = params.fetch(:page, 0).to_i
  @users = User.limit(5)
               .offset(5 * params[:page].to_i)
               .order(params.fetch(:sort, :first_name))
end

def show
  @user = User.find(params[:id])
end

def new
  @user = User.new
end

def edit
  @user = User.find(params[:id])
end

def create
  @user = User.new(user_params)
  @user = User.create(user_params)
  respond_to do |format|
    if @user.save
      #CREATE TWILIO REMINDER
      User.send_reminder_text_message("First Name: #{@user.first_name},
                                       Last Name: #{@user.last_name},
                                       Date of Birth: #{@user.date_of_birth},
                                       Favorite Color: #{@user.favorite_color}")

      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

def destroy
  @user.destroy
  redirect_to users_path
end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :dob, :phone_number, :favorite_color, :image, :avatar)
    end
end

