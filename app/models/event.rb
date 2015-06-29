class Event < ActiveRecord::Base
  belongs_to :city
  belongs_to :category
  belongs_to :user

  has_many :user_relationships,
           class_name:  "Relationship",
           foreign_key: "event_id",
           dependent:   :destroy

  has_many :attendants,
           through: :user_relationships,
           source: :user

  default_scope { order('starts_at ASC') }


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
                       :size => { :in => 0..4.megabytes },
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/
                       }
  validates :name,
            :description,
            :start_date,
            :end_date,
            :location,
            :starts_at,
            :ends_at,
            :city_id,
            :contact,
            :website,
            :cost,
            :category_id,
            :effort,
            :user_id, presence: true

end
