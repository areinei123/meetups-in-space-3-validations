class Meetup < ActiveRecord::Base
  validates :name, presence:true
  validates :location, presence:true
  validates :description, presence:true,
    length: {maximum: 1000}
  validates :time, presence:true

  has_many :events
  has_many :users, through: :events
end
