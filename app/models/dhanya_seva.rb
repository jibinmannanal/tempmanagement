class DhanyaSeva < ApplicationRecord
  has_rich_text :remarks
  belongs_to :user
end
