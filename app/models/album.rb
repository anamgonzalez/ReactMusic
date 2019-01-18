class Album < ApplicationRecord
  include SearchableByName

  def show
    @album = Albums.find(params[:id])
  end
end
