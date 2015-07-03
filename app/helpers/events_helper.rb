module EventsHelper

  def cost
    Cost.all
  end

  def effort
    Effort.all
  end

  def effort_icons(effort)
    if effort == 1
      icons = [
          fa_icon('circle lg'),
          fa_icon('circle-o lg'),
          fa_icon('circle-o lg')
      ]
      icons.join().html_safe
    elsif effort == 2
      icons = [
          fa_icon('circle lg'),
          fa_icon('circle lg'),
          fa_icon('circle-o lg')
      ]
      icons.join().html_safe
    else
      icons = [
          fa_icon('circle lg'),
          fa_icon('circle lg'),
          fa_icon('circle lg')
      ]
      icons.join().html_safe
    end
  end

  def similar_events
    @similar_events = @city.events.where(category_id: @event.category_id).where.not(id: @event.id).limit(4)
  end

end
