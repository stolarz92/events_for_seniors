class City < ActiveRecord::Base

  has_many :events do
    def filter(key,value)
      where("#{key}=?",value)
    end
  end

  def filtered_events(params)
    result = events
    params[:start_date] = params[:start_date].to_date.strftime("%Y-%m-%d")
    sliced_params(params).each do |key, value|
      result = result.filter(key,value)
    end
    params[:start_date] = params[:start_date].to_date.strftime("%d-%m-%Y")
    result
  end

  private

  def sliced_params params
    params.slice(:category_id, :start_date, :cost, :effort)
  end

end
