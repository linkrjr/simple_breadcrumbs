module SimpleBreadcrumbs
  
  autoload :Base, "simple_breadcrumbs/base"
  autoload :Helpers, "simple_breadcrumbs/helpers"
  autoload :Version, "simple_breadcrumbs/version"
  
end

ActionController::Base.send :include, SimpleBreadcrumbs::Base
ActionView::Base.send :include, SimpleBreadcrumbs::Helpers::BreadcrumbHelper
