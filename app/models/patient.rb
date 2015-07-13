class Patient < ActiveRecord::Base

  has_many :appointments
  has_many :schedulers, through: :appointments
  validates_presence_of :name, :sex, :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :name, :message => "This name has been used"

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  # t.string   "name"
  # t.string   "sex"
  # t.string   "email"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
end
