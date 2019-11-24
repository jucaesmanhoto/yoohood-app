class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home members]

  def home
    @page_name = 'Find a perfect event'
  end

  def members
    @page_name = 'members'
  end
end
