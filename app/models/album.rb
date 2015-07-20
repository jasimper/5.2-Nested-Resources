class Album < ActiveRecord::Base
  has_many :songs
  belongs_to :artist

  validates :title, presence: true
end
