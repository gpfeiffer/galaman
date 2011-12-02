class Competition < ActiveRecord::Base
  default_scope :order => 'date'
  has_many :events, :dependent => :destroy
  has_many :disciplines, :through => :events
  has_many :registrations, :dependent => :destroy
  has_many :swimmers, :through => :registrations
  has_many :standards
  has_many :qualifications, :through => :standards
  has_many :invitations, :dependent => :destroy
  has_many :clubs, :through => :invitations

  validates :name, :date, :presence => true
end
