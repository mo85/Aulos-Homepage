class Composer < Person
  
  has_many :plays
  
  def self.find_or_create_instance(firstname, lastname)
    composer = Composer.find_by_firstname_and_lastname(firstname, lastname)
    unless composer
      composer = Composer.new(:firstname => firstname, :lastname => lastname)
    end
    composer
  end
  
end