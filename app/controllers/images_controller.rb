class ImagesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def index

      @images = Image.all
     
      if params[:search] == nil && params[:search] != ''
        search = params[:search]
        @images = Image.joins(:user).where("color LIKE ? OR place LIKE ?", "%#{search}%", "%#{search}%")
      else
        @images = Image.all
      end

      @tags = Tag.all
        search = params[:search]

      @images = Image.joins(:user).where("color LIKE ? OR place LIKE ?", "%#{search}%", "%#{search}%")
        if params[:tag_ids].present?
          image_ids = []
          params[:tag_ids].each do |key, value| 
          if value == "1"
            Tag.find_by(name: key).images.each do |p| 
            image_ids << p.id
          end
        end
      end

        image_ids = image_ids.uniq
          @images = @images.where(id: image_ids) if image_ids.present?
          end
          if params[:tag]
          Tag.create(name: params[:tag])
          end
        end

    

    def new
        @images = Image.new
      end
    
    def create
        images = Image.new(image_params)

        images.user_id = current_user.id

        if images.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
    
    def show
        @image = Image.find(params[:id])
    end

    def edit
        @image = Image.find(params[:id])
    end

    def update
        image = Image.find(params[:id])
        if image.update(image_params)
          redirect_to :action => "show", :id => image.id
        else
          redirect_to :action => "new"
        end
    end

    private
      def image_params
        params.require(:image).permit(:image, :caption, :category, :color, :place, :Date_taken, tag_ids: [] )
    end
end