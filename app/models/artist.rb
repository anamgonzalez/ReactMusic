class Artist < ApplicationRecord
  include SearchableByName
  def show
    @artist = Artist.find(params[:id])
  end
end
