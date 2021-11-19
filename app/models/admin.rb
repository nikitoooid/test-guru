class Admin < User

  validates :first_name, presense: true
  validates :last_name, presense: true

end
