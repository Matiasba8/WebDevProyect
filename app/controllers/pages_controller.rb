class PagesController < ApplicationController
  def home
    $logged = session[:user_id]
    if $logged                                # if there is a connected user
      @logged_user = User.find_by(id: session[:user_id])  # and also we pass to the html the current user connected
    end
  end
  def do_nothing
    $logged = session[:user_id]
    if $logged                                # if there is a connected user
      @logged_user = User.find_by(id: session[:user_id])  # and also we pass to the html the current user connected
    end
  end
end
