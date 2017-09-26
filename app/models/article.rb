class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 50 }

  def pretty_path
    "/#{id}/#{title.split(/\W+/).join('-')}"
  end
end
