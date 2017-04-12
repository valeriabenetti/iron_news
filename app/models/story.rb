class Story < ApplicationRecord
  # URI is Uniform Resource Identifiers, which helps with making
  # sure that the url link has an HTTP or HTTPS
  validates :url, format: URI::regexp(%w(http https))

  belongs_to :created_by, class_name: "User"
end
