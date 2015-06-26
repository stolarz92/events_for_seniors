class RelationshipsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    current_user.follow(event)
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  def destroy
    event = Relationship.find(params[:id]).event
    current_user.unfollow(event)
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end
end
