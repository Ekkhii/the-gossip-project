class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		puts params.inspect
	end

	def create
		@gossip = Gossip.find(params[:gossip_id])
		@comment = @gossip.comments.create(comment_params)
    	redirect_to gossip_path(@gossip.id)
	end

	def edit
		@gossip = Gossip.find_by(id: params[:gossip_id])
	    @comment = Comment.find(params[:id])
	
	    @anonymous_commentor = @comment.anonymous_commentor
	    @body = @comment.body
	  end

  	def update
	    @comment = Comment.find(params[:id])
	    @comment.update(comment_params)
		redirect_to gossip_path(@comment.gossip_id)
	  end

	 def destroy
	    @comment = Comment.find(params[:id])
	    @comment.destroy
	    redirect_to gossip_path(@comment.gossip_id)
	  end

	private
	def comment_params
		params.require(:comment).permit(:anonymous_commentor, :body)
	end
end


