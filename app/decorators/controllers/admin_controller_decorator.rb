Naturesoft::Admin::AdminController.class_eval do
  before_action :set_articles, only: :index

  private

  def set_articles
    @articles = Naturesoft::Articles::Article.ordered.limit(3)
  end
end