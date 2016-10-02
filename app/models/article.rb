class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true, length: { minimum: 2, maximum: 150 }
  validates :body, presence: true, length: { minimum: 20 }

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end
end
