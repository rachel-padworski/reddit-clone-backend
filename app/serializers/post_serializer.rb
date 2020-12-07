class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image_url
  has_many :comments
  belongs_to :user
end
