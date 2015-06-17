class City < ActiveRecord::Base
  has_attached_file :image,
                    :styles => {
                        :thumb    => ['200x200#',  :jpg, :quality => 70],
                        :preview  => ['480x480#',  :jpg, :quality => 70],
                        :large    => ['600>',      :jpg, :quality => 70],
                        :retina   => ['1200>',     :jpg, :quality => 30]
                    },
                    :convert_options => {
                        :thumb    => '-set colorspace sRGB -strip',
                        :preview  => '-set colorspace sRGB -strip',
                        :large    => '-set colorspace sRGB -strip',
                        :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
                    }
  validates_attachment :image,
                       :presence => true,
                       :size => { :in => 0..4.megabytes },
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/
                       }

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

  #do zrobienia!!!!!!!!!!!!!!!!!!!
  def get_popular_cities
    city_ids = Event.group(:city_id).count.sort_by { |k, v| v}.to_h.keys
    city = City.find(city_ids).order(city_ids)
  end

  private

  def sliced_params params
    params.slice(:category_id, :start_date, :cost, :effort)
  end

end
