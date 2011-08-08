class Account < ActiveRecord::Base
	validates_presence_of :first_name, :message => "You must enter a first name and a surname"
	validates_presence_of :surname, :message => "You must enter a first name and a surname"
	validates_presence_of :password, :message => "You must enter a password"
	validates_presence_of :username, :message => "You must choose a username"
	validates_presence_of :email, :message => "You must enter your E-Mail address"
	validates_presence_of :account_type, :message => "You must select a payment type"
	validates_uniqueness_of :username, :message => "The username you have chosen has already been taken"
	validates_confirmation_of :password, :message => "The passwords entered do not match"
	validates_confirmation_of :email, :message => "The E-Mail addresses entered do not match"
end
