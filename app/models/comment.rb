class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def profile
        self.user.profile if self.user && self.user.profile
    end
end
