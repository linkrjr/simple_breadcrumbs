module Breadcrumbs
  
  autoload :Base, "breadcrumbs/base"
  autoload :Helper, "breadcrumbs/helper"
  
end

ActionController::Base.send(:include, Breadcrumbs::Base)
ActionView::Base.send(:include, Breadcrumbs::Helper)
