class SearchesController < ApplicationController
  def result
    @user = current_user
    @q = Room.ransack(params[:q])
    @rooms = @q.result.order(updated_at: :desc)
    @count = @rooms.count
  end
end
