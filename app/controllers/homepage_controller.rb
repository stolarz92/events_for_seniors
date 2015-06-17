class HomepageController < ApplicationController
  autocomplete :city, :name

  def index
    @cities = City.all.limit(4)
  end

end
