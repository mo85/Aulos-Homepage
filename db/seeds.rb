# encoding: utf-8 

users = User.create([
  { :name => "mark.odermatt", 
    :salt => "1234", 
    :hashed_password => User.encrypted_password('secret', "1234"),
    :is_admin => true }, 
  { :name => "aulosmember", 
    :salt => "5678",
    :hashed_password => User.encrypted_password('taerbinu', "5678")}
])

instruments = Instrument.create([
  { :name => "Klarinette", :family => 0 },
  { :name => "Flöte", :family => 0 },
  { :name => "Trompete", :family => 1 },
  { :name => "Horn", :family => 1},
  { :name => "Saxophon", :family => 0}
])

projects = Project.create([
  { :title => "Aulos 2010", :year => 2010 },
  { :title => "Aulos 2009", :year => 2009 },
  { :title => "Aulos 2008", :year => 2008 }
])

persons = Person.create([
  { :firstname => "Caroline", :lastname => "Krattiger" },
  { :firstname => "Manuela", :lastname => "Scheidegger" },
  
  { :firstname => "Mark", :lastname => "Odermatt" },
  { :firstname => "Pascal", :lastname => "Chevalier" },
  { :firstname => "Martia", :lastname => "Moser" },
  
  { :firstname => "Janine", :lastname => "Rösselet" },
  { :firstname => "Christine", :lastname => "Hogg" },
  { :firstname => "Anna", :lastname => "Rösti" },
  
  { :firstname => "Markus", :lastname => "Otto" },
  { :firstname => "Bernhard", :lastname => "Jörg" },
  { :firstname => "Rafael", :lastname => "Camartin" },

  { :firstname => "Valentin", :lastname => "Eschmann" },
  { :firstname => "Samuel", :lastname => "Stutz" },

  { :firstname => "Sandro", :lastname => "Blank" },
  { :firstname => "Dominik", :lastname => "Hüppin" },
  { :firstname => "Rahel", :lastname => "Kohler" },
  { :firstname => "Barbara", :lastname => "Aeschbacher" }
])