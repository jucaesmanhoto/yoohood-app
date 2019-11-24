class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home members]

  def home
    @page_name = 'Find a perfect event'
  end

  def members
    @page_name = 'members'
  end

  def profile
    # @page_name = "#{current_user.name.split(' ').first}'s profile"
  end
end
