class SubsController < ApplicationController

  def new
    @sub = Sub.new
    render :new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
    @sub = Sub.find_by(id: params[:id])
    if @sub && sub.moderator == current_user.id
      @sub.destroy
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render sub_url(@sub)
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def index
    @subs = Sub.all
    render :index
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
