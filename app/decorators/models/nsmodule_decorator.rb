Naturesoft::Nsmodule.class_eval do
  @articles = {
    "articles_list" => {
      "label" => "Articles list",
      "options" => {
        "category_id" => nil,
        "number_of_articles" => 5
      }    
    },
    "categories_list" => {
      "label" => "Categories list",
      "options" => {
        "parent_id" => nil,
        "number_of_categories" => 5
      }
    }
  }
end