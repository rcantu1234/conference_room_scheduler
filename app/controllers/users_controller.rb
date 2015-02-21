class UsersController < InheritedResources::Base
  #before_action :authenticate_user!

def index

  @current_page = params.fetch(:page, 0).to_i
  @users = User.limit(5)
               .offset(5 * params[:page].to_i)
               .order(params.fetch(:sort, :id))
  @users = User.order(:first_name).page params[:page]
end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :date_of_birth, :favorite_color)
    end
end

