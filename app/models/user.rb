class User < ApplicationRecord
    has_many :rankings
    has_many :categories, through: :rankings
    has_secure_password
end
