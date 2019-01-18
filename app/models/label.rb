class Label < ApplicationRecord
  include SearchableByName
  def show
    @label = Label.find(params[:id])
  end
end
