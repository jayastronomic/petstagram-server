class User < ApplicationRecord
    has_secure_password

    validates :full_name, presence: true
    validates :username, length: { minimum: 1}
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { minimum: 1 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
