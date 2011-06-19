module SimpleBreadcrumbs
  module Base
    
    autoload :ClassMethods, 'simple_breadcrumbs/base/class_methods'
    
    def self.included(base)
      base.extend(SimpleBreadcrumbs::Base::ClassMethods) 
    end

    def add_breadcrumb(text, url='', options={})
      @breadcrumbs ||= []
      
      parameters = options[:static] || {}
      
      build_parameters_from_method(options[:methods], parameters) if options[:methods]
      
      build_parameters_from_params(options[:params], parameters) if options[:params]
      
      route_parameters = build_route_parameters(options[:route], parameters) if options[:route]
      
      @breadcrumbs << [text, build_url(url, route_parameters, parameters)]
    end
    
    private 
    
    def build_url(path, route_parameters, other_parameters)
      url = send(path, *route_parameters, other_parameters)
    end
    
    def build_route_parameters(route_parameters, parameters)
      results = route_parameters.map do |value|
        parameters.delete(value) 
      end
      results.compact!
    end

    def build_parameters_from_method(methods, parameters)
      methods.each do |method|
        parameters.merge! self.send(method.to_s) if respond_to?(method.to_s)
      end
    end

    def build_parameters_from_params(parameters_from_params, parameters)
      parameters_from_params.each do |param|
        parameters[param] = params[param] if params.include?(param)
      end
    end
    
  end
end