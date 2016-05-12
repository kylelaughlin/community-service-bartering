class StaticPagesController < ApplicationController
  # Change default layout for all static pages
  layout "home"

  # Do not require login to visit static pages
  skip_before_action :require_login


  def home
  end
end
