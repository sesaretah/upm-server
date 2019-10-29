class Interaction < ApplicationRecord
  belongs_to :interactionable, :polymorphic => true

  def count
    Interaction.where(interaction_type: self.interaction_type, interactionable_id: self.interactionable_id, interactionable_type: self.interactionable_type).count
  end

end
