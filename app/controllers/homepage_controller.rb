class HomepageController < ApplicationController
  autocomplete :city, :name

  def index
  end
end
