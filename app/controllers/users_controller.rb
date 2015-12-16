class UsersController < ApplicationController
    def index
        @users = User.where('id != ?', current_user.id)
    end
end
