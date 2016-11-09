if Naturesoft::Core.available?("menus")
  Naturesoft::Menus::Menu.class_eval do
    @articles = {
      "single_article" => {
        "label" => "Single Article",
        "controller" => "/naturesoft/articles/articles",
        "action" => "detail",
        "params" => {
          "id" => nil
        }
      },
      "listing" => {
        "label" => "Listing",
        "controller" => "/naturesoft/articles/articles",
        "action" => "listing",
        "params" => {
          "cat_id" => nil
        }
      },
      "categories_articles" => {
        "label" => "FAQ (Categories Articles)",
        "controller" => "/naturesoft/articles/articles",
        "action" => "faq",
        "params" => {
          "cat_id" => nil,
          "current_cat_id" => nil
        }
      }
    }
  end
end