class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :images, dependent: :destroy
         validates :name, presence: true 
         validates :profile, length: { maximum: 200 } 
         has_many :likes, dependent: :destroy
         has_many :liked_images, through: :likes, source: :image
         mount_uploader :image, ImageUploader

         def already_liked?(image)
          self.likes.exists?(image_id: image.id)
        end  
end 