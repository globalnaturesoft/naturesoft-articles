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
      }
    }
  end
end