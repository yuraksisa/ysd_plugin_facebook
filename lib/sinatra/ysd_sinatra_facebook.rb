require 'ysd_md_variable'
require 'koala'

module Sinatra
  module YSD
    module Facebook

      def self.registered(app)
        
        # Add the local folders to the views and translations     
        app.settings.views = Array(app.settings.views).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'views')))
        app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'i18n')))       
        
        #
        # Facebook login
        #
        app.get '/fblogin' do 
         
          app_id = SystemConfiguration::Variable.get_value('facebook.app_id')
          app_code = SystemConfiguration::Variable.get_value('facebook.app_code')
          site_url = SystemConfiguration::Variable.get_value('facebook.site_url')

          session['oauth'] = Koala::Facebook::OAuth.new(app_id, app_code, site_url + '/fblogincallback')

		  redirect session['oauth'].url_for_oauth_code()  #Here we can tell permissions # redirect to facebook to get your code        
        	
        end
        
        #
        # Handle fb callback
        #
        app.get '/fblogincallback' do

  		  session['access_token'] = session['oauth'].get_access_token(params[:code])

          graph = Koala::Facebook::GraphAPI.new(session['access_token'])
          
          fb_profile = graph.get_object("me")

          puts "PROFILE: #{fb_profile.inspect}"

		  redirect '/'

        end

      end
    end #Facebook
  end #YSD
end #Sinatra