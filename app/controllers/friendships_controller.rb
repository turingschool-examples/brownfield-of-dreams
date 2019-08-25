class FriendshipsController < ApplicationController
	def create
		friend = current_user.friendships.build(friend_id: params[:id].to_i)
		if friend.save
			redirect_to dashboard_path
		else
			flash[:error] = "why tho"
			redirect_to dashboard_path
		end
	end
end
