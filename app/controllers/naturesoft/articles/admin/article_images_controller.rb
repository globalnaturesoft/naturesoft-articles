module Naturesoft
  module Articles
    module Admin
      class ArticleImagesController < Naturesoft::Admin::AdminController
        before_action :set_article_image, only: [:show, :edit, :enable, :disable, :update, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Article", naturesoft_articles.admin_article_images_path
          add_breadcrumb "Article Images", naturesoft_articles.admin_article_images_path
        end
    
        # GET /article_images
        def index
          @article_images = ArticleImage.search(params).paginate(:page => params[:page], :per_page => 200)
        end
    
        # GET /article_images/1
        def show
        end
    
        # GET /article_images/new
        def new
          @article_image = ArticleImage.new
          add_breadcrumb "New Article Image", nil,  class: "active"
        end
    
        # GET /article_images/1/edit
        def edit
          add_breadcrumb "Edit Article Image", nil,  class: "active"
        end
    
        # POST /article_images
        def create
          @article_image = ArticleImage.new(article_image_params)
          @article_image.user = current_user
          
          if @article_image.save
            redirect_to naturesoft_articles.edit_admin_article_image_path(@article_image.id), notice: 'Article image was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /article_images/1
        def update
          if @article_image.update(article_image_params)
            redirect_to naturesoft_articles.edit_admin_article_image_path(@article_image.id), notice: 'Article image was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /article_images/1
        def destroy
          @article_image.destroy
          render text: 'Article image was successfully destroyed.'
        end
        
        #CHANGE STATUS /article images
        def enable
          @article_image.enable
          render text: 'Article image was successfully active.'
        end
        
        def disable
          @article_image.disable
          render text: 'Article image was successfully inactive.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_article_image
            @article_image = ArticleImage.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def article_image_params
            params.fetch(:article_image, {}).permit(:name, :width, :height, :content, :status)
          end
      end
    end
  end
end
