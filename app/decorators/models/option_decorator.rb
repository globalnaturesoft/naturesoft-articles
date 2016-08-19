Naturesoft::Option.class_eval do
  @articles = {
    "items_per_page" => 10,
    "categories_items_per_page" => 200,
    "thumbnails" => {
      "0" => {
        "code" => "big",
        "width" => "500",
        "height" => "500",
        "scale" => "fit"
      },
      "1" => {
        "code" => "medium",
        "width" => "160",
        "height" => "160",
        "scale" => "fill"
      },
      "2" => {
        "code" => "small",
        "width" => "80",
        "height" => "80",
        "scale" => "fill"
      }
    },
    "modules" => [{
      "code" => "articles_list",
      "label" => "Articles list",
      "attributes" => {
        "category" => {
          "label" => "Category",
          "type" => "select2-ajax",
          "data-url" => "naturesoft_articles.select2_admin_categories_path",
          "required" => true
        },
        "number_of_articles" => {
          "label" => "",
          "type" => "text",
          "default" => 5,
          "required" => true
        }
      }
    }]
  }
end