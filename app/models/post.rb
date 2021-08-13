class Post < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :body
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_rich_text :body
end
