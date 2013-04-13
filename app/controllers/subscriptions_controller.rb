class SubscriptionsController < ApplicationController

  def create
  	channel = Channel.find params[:channel_id]
  	subscription = channel.subscribe current_username

  	respond_to do |format|
  	  if subscription
  	  	if subscription.save
  	  	  format.html { redirect_to channels_path, :notice => "You have successfully subscribe the channel: #{channel.name}" }
  	  	else
  	  	  render 'channels#index', :notice => 'cannot subscribe this channel'
  	  	end
  	  else
  	  	format.html { redirect_to channels_path, :notice => 'You have already subscribe this channel' }
  	  end
  	end
  end

end
