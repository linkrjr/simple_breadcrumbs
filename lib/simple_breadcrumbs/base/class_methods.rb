module SimpleBreadcrumbs
  module Base
    module ClassMethods
  
      def breadcrumbs
        yield self      
      end
      
      protected
      
      def add text, url='', options = {}
        parameter_options = {}
        %w(static params methods route).each do |el|
          parameter_options[el.to_sym] = options.delete(el.to_sym)
        end
        
        before_filter options do |controller|
          controller.add_breadcrumb text, url, parameter_options
        end
      end    
      
    end
  end
end