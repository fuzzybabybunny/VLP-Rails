class SiteController < ApplicationController

  # index is a Ruby action aka a Ruby method, renders a view for us
  # corresponds to views/site/index.html.erb
  def index
    @user = User.all.entries
  end

  def privacy
  end

  def terms
  end

end
