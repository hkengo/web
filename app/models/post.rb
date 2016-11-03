class Post < ActiveRecord::Base
  has_many :comments

  validates :title, presence: true#, length: {minimum: 4, aximum: 100}
  validates :content, presence: true#, length: {minimum: 20}
end
