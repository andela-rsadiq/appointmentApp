class Patient < ActiveRecord::Base
  has_many :appointments
  validates_presence_of :name, uniqueness: true
end
