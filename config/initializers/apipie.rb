Apipie.configure do |config|
  config.app_name                = "AngularTodo"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/apipie"
  config.default_version         = "1"
  config.translate               = false
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
