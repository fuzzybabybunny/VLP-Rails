class SiteController < ApplicationController

  before_action :is_authenticated?

  def index
    # render json: User.all.entries
    @users = User.all.entries
  end

  def privacy
  end

  def terms
  end

  def wdi
    @fuck = "you"
  end

end