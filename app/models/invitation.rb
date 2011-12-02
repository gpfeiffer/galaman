class Invitation < ActiveRecord::Base
  belongs_to :club
  belongs_to :competition
  has_many :registrations

  validates :club_id, :competition_id, :presence => true
end
