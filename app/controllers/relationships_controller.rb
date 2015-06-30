class RelationshipsController < ApplicationController
  before_action :logged_in_user
  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    current_user.follow(@event)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = current_user
    @event = Relationship.find(params[:id]).event
    @user.unfollow(@event)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
