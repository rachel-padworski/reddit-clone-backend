class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image_url, :user_id
  has_many :comments
  belongs_to :user
end
