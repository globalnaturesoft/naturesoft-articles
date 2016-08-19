Naturesoft::Menus::Menu.class_eval do
  @articles = {
    "single_article" => {
      "label" => "Single Article",
      "path" => "naturesoft_articles.detail_articles_path",
      "params" => {
        "id" => nil
      }
    }
  }
end