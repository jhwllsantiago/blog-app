class Tutorial < ApplicationRecord
    validates :category, presence: true
    validates :author, presence: true, length: { in: 3..50}
    validates :title, presence: true, length: { in: 3..50}
    validates :description, presence: true, length: { in: 5..100}
    validates :body, presence: true, length: { in: 10..300}
end
