module Naturesoft
  module Articles
    module Admin
      class ArticleCategoriesController < Naturesoft::Admin::AdminController
        before_action :set_article_category, only: [:show, :edit, :update, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Article", naturesoft.admin_article_categories_path
          add_breadcrumb "Article Categories", naturesoft.admin_article_categories_path
        end
    
        # GET /article_categories
        def index
          @article_categories = ArticleCategory.ordered.paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /article_categories/1
        def show
        end
    
        # GET /article_categories/new
        def new
          @article_category = ArticleCategory.new
          add_breadcrumb "New Article Category", nil,  class: "active"
        end
    
        # GET /article_categories/1/edit
        def edit
          add_breadcrumb "Edit Article Category", nil,  class: "active"
        end
    
        # POST /article_categories
        def create
          @article_category = ArticleCategory.new(article_category_params)
          
          @article_category.user = current_user
    
          if @article_category.save
            # update parent
            @article_category.parent.clear
            @article_category.parent << ArticleCategory.find(params[:parent_id]) if params[:parent_id].present?
            
            redirect_to naturesoft.edit_admin_article_category_path(@article_category.id), notice: 'Article category was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /article_categories/1
        def update
          if @article_category.update(article_category_params)
            # update parent
            @article_category.parent.clear
            @article_category.parent << ArticleCategory.find(params[:parent_id]) if params[:parent_id].present?
        
            redirect_to naturesoft.edit_admin_article_category_path(@article_category.id), notice: 'Article category was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /article_categories/1
        def destroy
          @article_category.destroy
          redirect_to naturesoft.admin_article_categories_url, notice: 'Article category was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_article_category
            @article_category = ArticleCategory.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def article_category_params
            params.require(:article_category).permit(:name, :description, :user_id, :level)
          end
      end
    end
  end
end
