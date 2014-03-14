class SiteController < ApplicationController

  # index is a Ruby action aka a Ruby method, renders a view for us
  # corresponds to views/site/index.html.erb

  before_action :is_authenticated?

  def index
    # @authenticatedConfirmation = is_authenticated?
    # render text: is_authenticated?
    @users = User.all.entries
  end

  def privacy
  end

  def terms
  end

  def stuff
  end

  def shit
  end

end
