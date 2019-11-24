class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home members]

  def home
  end
end
