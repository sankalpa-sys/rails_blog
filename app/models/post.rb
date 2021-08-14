class Post < ApplicationRecord
  validates :title, :presence => true, :length => {
    :maximum => 50}
    validates :body, :presence => true, :length => {
      :minimum => 250}
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_rich_text :body

  extend FriendlyId
  friendly_id :title, use: [:finders]
end
