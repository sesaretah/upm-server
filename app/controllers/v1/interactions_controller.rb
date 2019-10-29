class V1::InteractionsController < ApplicationController


  def create
    @interaction = Interaction.new(interaction_params)
    @interaction.user_id = current_user.id
    if @interaction.save
      render json:  InteractionSerializer.new(@interaction, source_type: params[:source_type], source_id: params[:source_id], user_id: current_user.id).as_json, status: :ok
    end
  end

  def destroy
    @interaction = Interaction.find(params[:id])
    if @interaction.destroy
      render json: { data: @interaction, klass: 'Interaction' }, status: :ok
    else
      render json: { data: @interaction.errors.full_messages  }, status: :ok
    end
  end

  def interaction_params
    params.require(:interaction).permit!
  end

end
