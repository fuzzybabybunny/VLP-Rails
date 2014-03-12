class SiteController < ApplicationController

  def index
    @user = User.all.entries
  end

  def privacy
  end

  def terms
  end

end
