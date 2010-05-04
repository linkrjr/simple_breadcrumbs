module Breadcrumbs
  
  module Base

    DEFAULT_PARTIAL_NAME = "breadcrumbs"
  
    def self.included(base)
      base.extend(ClassMethods) 
    end

    def add_breadcrumb text, url='', &block
      @breadcrumbs ||= []
         
      if block_given?
        vars = yield 
        if vars.is_a?(Hash)
          parameter = []
          vars[:parameters].each do |param|
            parameter << eval(param)
          end
          url = send(vars[:method], *parameter)
        else
          raise "Breadcrumb::add block must return a hash Ex.: {:method, :parameters}"  
        end
      else   
        url = eval(url) if url =~ /_path|_url|@/
      end  
    
      @breadcrumbs << [text, url]
    end
  
    module ClassMethods
  
      def breadcrumbs(&block)
        yield self      
      end

      def add text, url='', options = {}, &block
        before_filter options do |controller|
          controller.send(:add_breadcrumb, text, url, &block)
        end
      end    
    
    end
    
  end
    
end