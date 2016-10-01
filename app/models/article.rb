class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 2, maximum: 150 }
  validates :body, presence: true, length: { minimum: 20 }
end
