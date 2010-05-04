module Breadcrumbs
  
  module Helper
    
    def render_breadcrumbs(options={}, &block)
      return render_block(&block) if block_given?
      return render_passed_partial(options[:partial]) unless options.empty? || !options.include?(:partial)
      render_default_partial
    end
    
    private
    
    def render_block(&block)
      concat(capture(&block))
    end
    
    def render_default_partial(partial=nil)
      if partial
        concat(render :partial => partial)
      elsif !Dir.glob(File.join("#{RAILS_ROOT}","app","views","layouts","_#{Breadcrumbs::Base::DEFAULT_PARTIAL_NAME}.html.erb")).empty?
        concat(render :partial => File.join("#{RAILS_ROOT}","app","views","layouts","#{Breadcrumbs::Base::DEFAULT_PARTIAL_NAME}.html.erb"))
      end
    end
    
    alias_method :render_passed_partial, :render_default_partial
    
  end  
    
end