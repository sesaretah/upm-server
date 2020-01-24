class V1::RolesController < ApplicationController

  def index
    #@friend_ids = Friendship.friend_ids(current_user)
    #roles = Role.where('user_id IN (?)', @friend_ids).order('created_at desc')
    roles = Role.all
    render json: { data: ActiveModel::SerializableResource.new(roles, user_id: current_user.id,  each_serializer: RoleSerializer ).as_json, klass: 'Role' }, status: :ok
  end


  def show
    @role = Role.find(params[:id])
    render json: { data:  RoleSerializer.new(@role, user_id: current_user.id).as_json}, status: :ok
  end

  def create
    @role = Role.new(role_params)
    @role.user_id = current_user.id
    if @role.save
      @role.share(params[:channel_id]) if !params[:channel_id].blank?
      render json: { data: RoleSerializer.new(@role).as_json, klass: 'Role' }, status: :ok
    end
  end

  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(role_params)
      render json: { data: RoleSerializer.new(@role, user_id: current_user.id).as_json, klass: 'Role' }, status: :ok
    else
      render json: { data: @role.errors.full_messages  }, status: :ok
    end
  end

  def destroy
    @role = Role.find(params[:id])
    if @role.destroy
      render json: { data: 'OK'}, status: :ok
    end
  end

  def role_params
    params.require(:role).permit!
  end
end
