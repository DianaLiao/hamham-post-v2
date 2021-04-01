class MembershipsController < ApplicationController

  def new
    @membership = Membership.new
  end

  def create

    @membership = Membership.new(mem_params)
    if(@membership.save)
      flash[:notice] = "Nice one bro"
      redirect_to board_path(mem_params[:board_id])
    else
      flash[:error] = "You messed up bro"
      redirect_to board_path(mem_params[:board_id])
    end

  end

  def delete
    @membership = Membership.find_by(mem_params)
    @membership.destroy
    flash[:notice] = "Your membership has been DESTROYED"
    redirect_to board_path(mem_params[:board_id])
  end

  private

  def mem_params
    params.require(:membership).permit(:user_id, :board_id, :admin)
  end

end
