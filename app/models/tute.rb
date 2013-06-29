class Tute < ActiveRecord::Base
  attr_accessible :episode, :title, :video_link, :read_link, :general_type
  validates_presence_of :episode, :title, :video_link, :read_link, :general_type
end
