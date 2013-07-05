class Artist < ActiveRecord::Base
  attr_accessible :name, :url

  validates_presence_of :name, :url
  has_many :songs
  has_many :albums, :through => :songs
end
