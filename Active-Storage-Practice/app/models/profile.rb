class Profile < ApplicationRecord
    has_one_attached :image do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end

    validates :name, :email, presence: true
end
