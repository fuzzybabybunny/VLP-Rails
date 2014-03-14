class SiteController < ApplicationController

  # index is a Ruby action aka a Ruby method, renders a view for us
  # corresponds to views/site/index.html.erb
  def index
    @authenticatedConfirmation = is_authenticated?
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
