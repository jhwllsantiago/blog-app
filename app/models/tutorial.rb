class Tutorial < ApplicationRecord
    validates :category, presence: true
    validates :author, presence: true
end
