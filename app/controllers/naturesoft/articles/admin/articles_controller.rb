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
          @articles = Article.search(params).paginate(:page => params[:page], :per_page => Naturesoft::Option.get("articles", "items_per_page"))
        end
    
        # GET /articles/1
        def show
        end
    
        # GET /articles/new
        def new
          @article = Article.new
          add_breadcrumb "New Article", nil,  class: "active"
        end
    
        # GET /articles/1/edit
        def edit
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
        
        #CHANGE APPROVE /articles
        def approve
          @article.approve
          render text: 'Article was successfully approved.'
        end
        
        def disapprove
          @article.disapprove
          render text: 'Article was successfully disapproved.'
        end
        
        #CHANGE STATUS /articles
        def enable
          @article.enable
          render text: 'Article was successfully active.'
        end
        
        def disable
          @article.disable
          render text: 'Article was successfully inactive.'
        end
        
        # DELETE /articles/delete?ids=1,2,3
        def delete
          @articles = Article.where(id: params[:ids].split(","))
          @articles.destroy_all
          render text: 'Article(s) was successfully destroyed.'
        end
        
        # GET /articles/select2
        def select2
          render json: Article.select2(params)
        end
        
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_article
            @article = Article.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def article_params
            params.fetch(:article, {}).permit(:image_url, :approved, :title, :content, :status, :image_id, :intro_text)
          end
      end
    end
  end
end
