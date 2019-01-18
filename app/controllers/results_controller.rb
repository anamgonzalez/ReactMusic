class ResultsController < ApplicationController

  def search
    term = params[:term]

    artists = Artist.search(term)
    albums  = Album.search(term)
    labels  = Label.search(term)

    @results  = artists + albums + labels
  end

  def show
  end
end
