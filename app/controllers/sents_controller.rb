class SentsController < ApplicationController
    def index
        @messages = Message.where(sender: current_user).order(created_at: :desc)
    end
end
