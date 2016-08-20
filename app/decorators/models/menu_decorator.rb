Naturesoft::Menus::Menu.class_eval do
  @articles = {
    "single_article" => {
      "label" => "Single Article",
      "controller" => "/naturesoft/articles/articles",
      "action" => "detail",
      "params" => {
        "id" => nil
      }
    }
  }
  
  def url
    article = Naturesoft::Articles::Article.where(id: get_params["id"]).first
    if article.present?
      self.path({title: article.title, category: article.categories.first.name})
    else
      return "...not generated!"
    end
  end
end