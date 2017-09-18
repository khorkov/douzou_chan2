class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
puts "comment.post id is #{@comment.post_id}"
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to controller: 'posts', action: 'show', id: @comment.post_id
    else
      render current_user
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end