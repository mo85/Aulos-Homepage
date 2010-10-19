authorization do
  role :guest do
    has_permission_on :projects, :to => [:read]
    has_permission_on :orders, :to => [:read, :create, :new]
    
  end
  
  role :user do
    includes :guest    
  end
  
  role :admin do
    has_permission_on [:users, :orders], :to => [:read, :manage]
    includes :user
  end
end

privileges do
  privilege :manage do
    includes :new, :create, :adjust, :destroy
  end
  
  privilege :read do
    includes :index, :show
  end
  
  privilege :adjust do
    includes :edit, :update
  end
  
end
