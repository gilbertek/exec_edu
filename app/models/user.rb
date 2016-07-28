class User < ApplicationRecord
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
