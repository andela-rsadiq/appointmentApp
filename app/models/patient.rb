class Patient < ActiveRecord::Base

  has_many :appointments
  has_many :schedulers, through: :appointments
  validates_presence_of :name
  validates_uniqueness_of :name, :message => "This name has been used"

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
