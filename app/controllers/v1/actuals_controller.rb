class V1::ActualsController < ApplicationController
  def index
    actuals = Actual.all
    render json: { data: ActiveModel::SerializableResource.new(actuals,  each_serializer: ActualSerializer ).as_json, klass: 'Actual' }, status: :ok
  end

  def search
    actuals = Actual.search params[:q], star: true
    render json: { data: ActiveModel::SerializableResource.new(actuals,  each_serializer: ActualSerializer ).as_json, klass: 'Actual' }, status: :ok
  end

  def show
    @actual = Actual.find(params[:id])
    render json: { data: ActualSerializer.new(@actual).as_json, klass: 'Actual' }, status: :ok
  end

  def create
    @actual = Actual.new(actual_params)
    @actual.user_id = current_user.id
    @actual.meta_id = actual_params["content"][0]["metaId"].to_i
    if @actual.save
      render json: { data: ProfileSerializer.new(@actual.user.profile).as_json, klass: 'Profile' }, status: :ok
    end
  end

  def update
    @actual = current_user.actual
    if @actual.update_attributes(actual_params)
      render json: { data: ActualSerializer.new(@actual).as_json, klass: 'Actual' }, status: :ok
    end
  end

  def delete
    @actual = Actual.find_by_uuid(params[:uuid])
    @user = @actual.user
    if @actual
      @actual.destroy
      render json: { data: ProfileSerializer.new(@user.profile).as_json, klass: 'Profile' }, status: :ok
    end
  end



  def actual_params
    params.require(:actual).permit!
  end
end
