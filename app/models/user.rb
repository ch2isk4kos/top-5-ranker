class User < ApplicationRecord
    has_many :rankings
    has_many :categories, through: :rankings
    has_secure_password
    validates :username, :email, presence: true, uniqueness: true

end
