require 'ysd-plugins' unless defined?Plugins::Plugin
require 'sinatra/ysd_sinatra_facebook'
require 'ysd_plugin_facebook_extension'

Plugins::SinatraAppPlugin.register :facebook do

   name=        'facebook'
   author=      'yurak sisa'
   description= 'Integrate the facebook'
   version=     '0.1'
   sinatra_extension Sinatra::YSD::Facebook
   hooker            Huasi::FacebookExtension
  
end