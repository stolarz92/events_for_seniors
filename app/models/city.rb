class City < ActiveRecord::Base

  has_many :events do
    def filter(key,value)
      where("#{key}=?",value)
    end
  end

  def filtered_events(params)
    result = events
    sliced_params(params).each do |key, value|
      result = result.filter(key,value)
    end
    result
  end

  private

  def sliced_params params
    params.slice(:category_id, :start_date, :cost)
  end

end
