module EventsHelper
  def get_categories(events)
    categories_ids = events.pluck(:category_id)
    categories = Category.where(id: categories_ids)
  end
end
