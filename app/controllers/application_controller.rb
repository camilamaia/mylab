require 'yaml'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ###########################################
  # SECURITY (security?)
  ###########################################
  logins = YAML::load_file(File.join(Dir.pwd, '/config', 'logins.yml'))
  use Rack::Auth::Basic, "Protected Area" do |u, p|
    logins[:users].has_key? u and logins[:users][u] == p
  end
end
