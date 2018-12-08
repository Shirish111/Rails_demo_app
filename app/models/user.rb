class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true
    validates :password,  presence: true
    validates :email, uniqueness: true, presence: true
    validates :password, presence: true, on: :create
    has_one :profile
    has_many :addresses
    has_many :posts
    has_many :pictures
    has_many :likes
    has_many :comments
    has_many :followees, through: "follows"
    has_many :followers, through: "follows"
end
