module EventsHelper
  def effort
    {
        easy: 1,
        medium: 2,
        hard: 3
    }
  end

  def cost
    {
        free: 1,
        paid: 2
    }
  end

  def similar_events
    @similar_events = @city.events.where(category_id: @event.category_id).where.not(id: @event.id).limit(4)
  end

end
