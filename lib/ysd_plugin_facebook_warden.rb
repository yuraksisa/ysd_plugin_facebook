require 'warden' unless defined?Warden
require 'ysd_md_profile' unless defined?Users::Profile

module WardenStrategy

  #
  # It's an strategy to allow anonymous users access to the system
  #
  class FacebookWardenStrategy < Warden::Strategies::Base
    
    #
    # Check when the strategy is valid
    #
    # If there is no user connected in the system
    #
    def valid?

      (session.has_key?(:fb_user)) and (user.nil?)

    end
    
    #
    # Authenticate the user
    #
    def authenticate!
      
      success!(session[:fb_user])

    end


  end #AnonymousWardenStrategy
end #AnonymousWardenStrategy	