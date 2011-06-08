module SimpleBreadcrumbs
  module Base
    
    autoload :ClassMethods, 'simple_breadcrumbs/base/class_methods'
    
    def self.included(base)
      base.extend(SimpleBreadcrumbs::Base::ClassMethods) 
    end

    def add_breadcrumb(text, url='', options={})
      @breadcrumbs ||= []
      
      all_parameters = options[:static_parameters] || {}
      
      build_parameters_from_method(options[:methods], all_parameters)
      
      build_parameters_from_params(options[:parameters_from_params], all_parameters)
      
      route_parameters = build_route_parameters(options[:route_parameters], all_parameters)

      debugger
      
      # prepare the url
      # add url to breadcrumbs array
    
      @breadcrumbs << [text, url]
    end
    
    private 
    
    def build_route_parameters(route_parameters, all_parameters)
      result = []
      route_parameters.each do |param|
        result << all_parameters.delete(param) if all_parameters.include?(param)
      end
      result
    end
    
    def build_parameters_from_method(methods, all_parameters)
      methods.each do |method|
        all_parameters.merge! self.send(method.to_s) if respond_to?(method.to_s)
      end
    end

    def build_parameters_from_params(parameters_from_params, all_parameters)
      parameters_from_params.each do |param|
        all_parameters[param] = params[param] if params[param]
      end
    end
    
  end
end