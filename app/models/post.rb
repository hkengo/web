class Post < ActiveRecord::Base
  validates :title, length: {minimum: 4, aximum: 100}, presence: true
  validates :content, lenth: {minimum: 20}, presence: true
end
