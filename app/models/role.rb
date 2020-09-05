class Role < ApplicationRecord
  has_many :permissions
  has_many :users, through: :permissions

validates :name, presence: true, uniqueness: true
end
