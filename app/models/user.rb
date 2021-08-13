class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def username
    self.email.split("@")[0]
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
