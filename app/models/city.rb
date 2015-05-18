class City < ActiveRecord::Base
  has_many :events

  def self.search(search)
    where("name LIKE ?", "%#{search}")
  end
end
