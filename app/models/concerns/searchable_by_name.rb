module SearchableByName
  extend ActiveSupport::Concern
  included do
    scope :search, ->(term) { where("name LIKE ?", "%#{term}%") }
  end
end
