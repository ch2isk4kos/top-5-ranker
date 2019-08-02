class Sport < ApplicationRecord
    has_many :players
    has_many :rankings, through: :players

    validates :name, uniqueness: true, presence: true
end
