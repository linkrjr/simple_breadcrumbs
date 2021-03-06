module SimpleBreadcrumbs
  module Helpers
    module BreadcrumbHelper

      DEFAULT_PARTIAL_NAME = "breadcrumbs"

      def render_breadcrumbs(options={}, &block)
        return render_block(&block) if block_given?
        render_partial(options[:partial])
      end

      private

      def render_block(&block)
        capture(&block)
      end

      def render_partial(partial=nil)
        partial ||= File.join("layouts", DEFAULT_PARTIAL_NAME)
        render :partial => partial
      end
      
    end
  end  
end