class Story < ApplicationRecord
  validates :email, presence: true
  validates :url, :format => URI::regexp(%w(http https))
end
