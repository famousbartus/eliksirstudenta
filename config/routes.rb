ActionController::Routing::Routes.draw do |map|
  map.root :controller => "static"

  map.resources :static, :collection => {:index => :get, :legenda => :get, :regulamin => :get, :kontakt => :get, :send_email => :post}

  map.resources :registration,
                :collection => {:new => :get, :create => :post, :thanks => :get, :validate => :get, :validation_thanks => :get, :validation_fail => :get},
                :path_name => {:validate => "validate/:id/:hash"}

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
