class EpicenterController < ApplicationController
  def feed
  	@following_ids = current_user.following
  	@following_hoots = []
  	Hoot.all.each do |hoot|
  		if @following_ids.include?(hoot.user_id.to_s)
  			@following_hoots.push(hoot)
  		end
  	end
  end

  def show_user
  	@display_user = User.find(params[:user_id])
  end

  def all_users
    @users = User.all
  end

  def now_following
  	follow_user_id = params[:follow_user_id]
  	current_user.following.push(follow_user_id)
  	current_user.save!
  	redirect_to show_user_path(user_id: follow_user_id)
  end

  def unfollow
  	unfollow_user_id = params[:unfollow_user_id]
  	current_user.following.delete(unfollow_user_id)
  	current_user.save!
  	redirect_to show_user_path(user_id: unfollow_user_id)
  end

  def tag_hoots
    puts params
    @tag = Tag.find(params[:id])
    @tagged_hoots = @tag.hoots
  end
end
