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
      }
    }
  end
end