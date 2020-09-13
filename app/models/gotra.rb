class Gotra < ApplicationRecord
  validates :name, presence: true,
                    uniqueness: true
end
