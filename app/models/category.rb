class Category < ApplicationRecord
    has_many :rankings
    has_many :users, :rankings

    validates :title, uniqueness: true, presence: true
end
