module CitiesHelper
  def get_date
    @date = Time.now.strftime("%Y-%m-%d")
  end
end
