class Account < ActiveRecord::Base
	validates_presence_of :username, :password, :name, :email, :account_type
	validates_confirmation_of :password
	validates_uniqueness_of :username
	
	HUMANIZED_ATTRIBUTES = {
    	:password_confirmation => "Confirm Password"
 	}

  	def self.human_attribute_name(attr)
    	HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  	end
end
