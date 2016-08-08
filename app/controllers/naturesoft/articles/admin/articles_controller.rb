module Naturesoft
  module Articles
    module Admin
      class ArticlesController < Naturesoft::Admin::AdminController
        before_action :set_article, only: [:show, :edit, :update, :approve, :disapprove, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Article", naturesoft_articles.admin_articles_path
          add_breadcrumb "Articles", naturesoft_articles.admin_articles_path
        end
    
        # GET /articles
        def index
          @articles = Article.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /articles/1
        def show
        end
    
        # GET /articles/new
        def new
          @article = Article.new
          @categories = Category.all
          add_breadcrumb "New Article", nil,  class: "active"
        end
    
        # GET /articles/1/edit
        def edit
          @categories = Category.all
          add_breadcrumb "Edit Article", nil,  class: "active"
        end
    
        # POST /articles
        def create
          @article = Article.new(article_params)
          @article.categories.clear
          @article.user = current_user
          
          if params[:category_ids].present?
            params[:category_ids].each do |id|      
              @article.categories << Category.find(id)
            end
          end
    
          if @article.save
            redirect_to naturesoft_articles.edit_admin_article_path(@article.id), notice: 'Article was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /articles/1
        def update
          @categories = Category.all
          @article.categories.clear
          
          if params[:category_ids].present?
            params[:category_ids].each do |id|      
              @article.categories << Category.find(id)
            end
          end
          
          if @article.update(article_params)
            redirect_to naturesoft_articles.edit_admin_article_path(@article.id), notice: 'Article was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /articles/1
        def destroy
          @article.destroy
          render text: 'Article was successfully destroyed.'
        end
        
        def approve
          @article.approved = true
          @article.save
          render text: 'Article was successfully approved.'
        end
        
        def disapprove
          @article.approved = false
          @article.save
          render text: 'Article was successfully disapproved.'
        end
        
        def enable
          @article.status = "active"
          @article.save
          render text: 'Article was successfully active.'
        end
        
        def disable
          @article.status = "inactive"
          @article.save
          render text: 'Article was successfully inactive.'
        end
        
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_article
            @article = Article.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def article_params
            params.fetch(:article, {}).permit(:image_url, :approved, :title, :content, :user_id)
          end
      end
    end
  end
end
