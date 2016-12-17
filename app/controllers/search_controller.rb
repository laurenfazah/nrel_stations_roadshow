class SearchController < ApplicationController
  def index
    @stations = NrelSearch.filter(zip: params[:q])
  end
end
