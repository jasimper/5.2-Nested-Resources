class Album < ActiveRecord::Base
  has_many :songs
  belongs_to :artists

  validates :title, presence: true
end
