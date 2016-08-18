Deface::Override.new(
  :virtual_path => "admin/modules/_main_menu",
  :name => "add_articles_setting_link_to_main_menu",
  :insert_after => "[data-naturesoft-hook='setting_menu']",
  :partial => "overrides/articles_setting_link",
  :namespaced => true,
  :original => 'f5fe48b6dc6986328e0b873b3ffa1b228dd52a7c')