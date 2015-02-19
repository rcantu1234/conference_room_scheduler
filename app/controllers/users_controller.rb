class UsersController < InheritedResources::Base

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :date_of_birth, :favorite_color)
    end
end

