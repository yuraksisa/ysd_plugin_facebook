require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener

#
# Forum Extension
#
module Huasi

  class FacebookExtension < Plugins::ViewListener
                        
     #
     # Installing
     #
     def install(context={})

       SystemConfiguration::Variable.first_or_create({:name => 'facebook.app_id'},
                                                     {:value => '', :description => 'Facebook APP Id', :module => :facebook})

       SystemConfiguration::Variable.first_or_create({:name => 'facebook.app_code'},
                                                     {:value => '', :description => 'Facebook APP Code', :module => :facebook})

       SystemConfiguration::Variable.first_or_create({:name => 'facebook.site_url'},
                                                     {:value => '', :description => 'Facebook APP Site URL', :module => :facebook})       
     end
     
     #
     # Login stategies
     #
     def login_strategy(context={})

       app = context[:app]

       app.partial :fb_login

     end

  end #MailExtension
end #Social