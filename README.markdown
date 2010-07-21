# Breadcrumbs


This plugin is an attempt to implementation a simple to use breadcrumbs renderer.
The code here was initially implemented as a core lib on a project a later turned into a plugin.

The code was initially based on Przemysław Szeryf Kowalczyk sample code 
posted on his blog (http://szeryf.wordpress.com/2008/06/13/easy-and-flexible-breadcrumbs-for-rails/) and then moved on and turned into this plugin.

## Install

script/plugin install git://github.com/linkrjr/breadcrumbs

## Usage

### Controllers setup

Controllers are setup by calling the "breadcrumbs" class method

#### Simple sample

Call the "breadcrumbs" method inside your controllers and pass it a block	

    class AnyController < ApplicationController
      breadcrumbs do |breadcrumb|
        breadcrumb.add("Home","/") 
        breadcrumb.add("First","/first")
        breadcrumb.add("Second", :only => [:show, :new, :edit])    
      end
    end

The method "add" above will be available from the block parameter.

Add method:	
	
 :text => The text to be display in the breadcrumbs
 :url='' => The url to link to, not mandatory so no link will be created
 :options={} => The same list of options that can be passed to a before_filter, view http://api.rubyonrails.org/classes/ActionController/Filters/ClassMethods.html#M000526 for more details
 :&block => A block can be used to add dynamic parameters to a url, see example below
	
#### Dynamic urls	

 breadcrumbs do |breadcrumb|
   breadcrumb.add("Home","/") 
   breadcrumb.add("First","/first")
   breadcrumb.add("Second", :only => [:show, :new, :edit]) do 
     {:method => "second_path", :parameters => ["params[:id]"]}
   end
 end

Parameters can be passed to methods that will create the url string, 
the parameters must be ordered following the sequence of parameters the method expects

Eg.: second_path(param1, param2) => {:method => "second_path", :parameters => ["param1","param2"]}

### Rendering breadcrumbs

There are 3 possible ways to render the breadcrumbs:

- Default Layout
- Passing a partial
- Passing a block
	
#### Default Layout

The plugin will look for a layout called _breadcrumbs.html.erb in the layouts folder.

 <% render_breadcrumbs %>

#### Passing a partial

A partial can be create and passed in just like a normal render.

 <% render_breadcrumbs :partial => "breadcrumbs" %> - will look for the partial inside the processed view page folder

or

 <% render_breadcrumbs :partial => "layouts/breadcrumbs" %> - will look for the partial inside the layouts folder

The partial filename follows the same rules for creating partials

#### Passing a block

A block containing the html to be rendered can be used

 <% breadcrumbs do %>
	<% if @breadcrumbs %>
	  <div id="breadcrumbs">
	    <ul>
	      <% @breadcrumbs.each do |txt, path| %>
	        <li><%= link_to(txt, path) %></li>
	      <% end  %>
	    </ul>
	  </div>
	<% end -%>
 <% end %>	

#### Available variables

A variable called @breadcrumbs will be available in each of the three option above mentioned, 
this variable is an array containing the text and the url for the breadcrumbs

## Contact

Email: ronaldo(dot)junior(at)gmail(dot)com

## License

Copyright (c) 2010 Linkrjr, released under the MIT license
