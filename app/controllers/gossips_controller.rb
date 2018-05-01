class GossipsController < ApplicationController
  def new
  	@gossip = Gossip.new
  end

  def create
  	@gossip = Gossip.create(params.permit(:anonymous_author, :content, :id))
    redirect_to gossip_path(@gossip.id)
  end

  def show
  	@gossip= Gossip.find_by(id: params[:id])
  	@anonymous_author = @gossip.anonymous_author
  	@content = @gossip.content
  end

  def index
  	@gossips = Gossip.all
  end

  def edit
    @gossip= Gossip.find_by(id: params[:id])
    @anonymous_author = @gossip.anonymous_author
    @content = @gossip.content
  end

  def update
    @gossip = Gossip.find_by(id: params[:id])
    gossip_params = params.require(:gossip).permit(:anonymous_author, :content)
    @gossip.update(gossip_params)
    redirect_to gossip_path(@gossip.id)
  end

  def destroy
    @gossip = Gossip.find_by(id: params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
end
