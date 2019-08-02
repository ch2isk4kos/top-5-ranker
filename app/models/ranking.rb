class Ranking < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :players
    has_many :sports, through: :players
end
