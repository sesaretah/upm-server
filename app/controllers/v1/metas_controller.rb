class V1::MetasController < ApplicationController
  def index
    metas = Meta.all
    render json: { data: ActiveModel::SerializableResource.new(metas,  each_serializer: MetaSerializer ).as_json, klass: 'Meta' }, status: :ok
  end

  def search
    metas = Meta.search params[:q], star: true
    render json: { data: ActiveModel::SerializableResource.new(metas,  each_serializer: MetaSerializer ).as_json, klass: 'Meta' }, status: :ok
  end

  def show
    @meta = Meta.find(params[:id])
    render json: { data: MetaSerializer.new(@meta).as_json, klass: 'Meta' }, status: :ok
  end

  def create
    @meta = Meta.new(meta_params)
    @meta.user_id = current_user.id
    @meta.meta_schema = JSON.parse(meta_params["meta_schema"])
    if @meta.save
      render json: { data: MetaSerializer.new(@meta).as_json, klass: 'Meta' }, status: :ok
    end
  end

  def update
    @meta = Meta.find(params[:id])
    if @meta && @meta.update_attributes(meta_params)
      render json: { data: MetaSerializer.new(@meta).as_json, klass: 'Meta' }, status: :ok
    end
  end



  def meta_params
    params.require(:meta).permit!
  end
end
