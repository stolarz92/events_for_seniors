module EventsHelper
  def effort
    {
        Mały: 1,
        Średni: 2,
        Duży: 3
    }
  end

  def cost
    {
        Bezpłatne: 1,
        Płatne: 2
    }
  end

  def similar_events
    @similar_events = @city.events.where(category_id: @event.category_id).where.not(id: @event.id).limit(4)
  end

end
