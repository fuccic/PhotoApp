class CommentsController < ApplicationController
	# before_action :authenticate_user!


	def create
	  author_name = comment_params[:author_name]
		body = comment_params[:body]
		
		post_id = params[:post_id]
	  @comment = Comment.create(:author_name => author_name, :body => body, :user_id => current_user.id, :post_id => post_id)
	  @comment.user = current_user
	  #user.comments << thing

	  redirect_to '/'
	end




	private

	def comment_params
  params.require(:post).permit(:author_name, :body)
	end

end
