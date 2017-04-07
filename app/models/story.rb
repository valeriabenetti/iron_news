class Story < ApplicationRecord
  validates :email, :url, presence: true
end
