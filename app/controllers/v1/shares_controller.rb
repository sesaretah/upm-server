class V1::SharesController < ApplicationController


  def create
    @share = Share.new(share_params)
    @share.user_id = current_user.id
    if @share.save
      render json:  ShareSerializer.new(@share, user_id: current_user.id).as_json, status: :ok
    end
  end

  def destroy
    @share = Share.find(params[:id])
    if @share.destroy
      render json: { data: @share, klass: 'Share' }, status: :ok
    else
      render json: { data: @share.errors.full_messages  }, status: :ok
    end
  end

  def share_params
    params.require(:share).permit!
  end

end
