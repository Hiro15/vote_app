class Board < ApplicationRecord
  validates :body, presence: true
end
