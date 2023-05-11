class SubsController < ApplicationController
  before_action :require_logged_in,except:[:show,:index]
  
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = params[:user_id]
    if @sub.save 
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def update  
    @sub = Sub.find_by(id: params[:id])
    if @sub.update(sub_params)
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render sub_url(@sub)
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
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
    params.require(:sub).permit(:title, :description,:user_id)
  end

end
