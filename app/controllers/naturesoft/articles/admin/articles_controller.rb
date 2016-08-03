module Naturesoft
  module Articles
    module Admin
      class ArticlesController < Naturesoft::Admin::AdminController
        before_action :set_article, only: [:show, :edit, :update, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Article", naturesoft.admin_articles_path
          add_breadcrumb "Articles", naturesoft.admin_articles_path
        end
    
        # GET /articles
        def index
          @articles = Article.ordered.paginate(:page => params[:page], :per_page => 10)
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
          
          @article.user = current_user
    
          if @article.save
            redirect_to naturesoft.edit_admin_article_path(@article.id), notice: 'Article was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /articles/1
        def update
          if @article.update(article_params)
            redirect_to naturesoft.edit_admin_article_path(@article.id), notice: 'Article was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /articles/1
        def destroy
          @article.destroy
          redirect_to naturesoft.admin_articles_url, notice: 'Article was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_article
            @article = Article.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def article_params
            params.require(:article).permit(:image_url, :title, :content, :user_id)
          end
      end
    end
  end
end
