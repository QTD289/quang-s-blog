class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :content, presence: true, length: { minimum: 2, maximum: 100 }
end
