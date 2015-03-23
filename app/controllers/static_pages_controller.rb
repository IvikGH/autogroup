class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def home
  end

  def contacts
    respond_to do |format|
      format.html { render layout: "main" }
    end
  end

  def about
  end

  def help
  end

  def import
    unless current_user.admin
      render  file: "public/404.html",
              layout: "main",
              status: 404
      return
    end

    respond_to do |format|
      format.html { render layout: "main" }
    end
  end

  def history
    unless current_user
      render  file: "public/404.html",
              layout: "main",
              status: 404
      return
    end

    respond_to do |format|
      format.html { render layout: "main" }
    end
  end

end
