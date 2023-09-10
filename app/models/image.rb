class Image < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user 
    has_many :likes, dependent: :destroy
    has_many :image_tag_relations, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :tags, through: :image_tag_relations, dependent: :destroy
end