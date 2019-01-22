class ResultsController < ApplicationController

  def search
    respond_to do |format|
      format.html
      format.json do
        term = params[:term]
        if term.present?
          artists = Artist.search(term)
          albums  = Album.search(term)
          labels  = Label.search(term)
          results = artists + albums + labels
        else
          results = []
        end
        results.map! do |result|
          {
            id:       result.id,
            name:     result.name,
            location: url_for(result)
          }
        end
        render json: results
      end
    end
  end

end
