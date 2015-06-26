class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         password_length: 4..20

  has_many :events
  has_many :event_relationships,
           class_name: "Relationship",
           foreign_key: "user_id",
           dependent: :destroy
  has_many :attendances,
           through: :event_relationships,
           source: :event

  def admin
  end

  # Follows a user.
  def follow(event)
    event_relationships.create(event_id: event.id)
  end

  # Unfollows a user.
  def unfollow(event)
    event_relationships.find_by(event_id: event.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(event)
    following.include?(event)
  end
end
