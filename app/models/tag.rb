class Tag < ApplicationRecord
    validates :name, presence: true
    has_many :image_tag_relations, dependent: :destroy
    has_many :images, through: :image_tag_relations, dependent: :destroy
end