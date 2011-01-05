authorization do
  role :guest do
    has_permission_on :projects, :people, :conductors, :concerts, :events, :news, :guestnotes, :to => [:read]
    has_permission_on :orders, :to => [:read, :create, :new]
    has_permission_on [:plays, :parts], :to => :read
  end
  
  role :user do
    includes :guest    
  end
  
  role :admin do
    has_permission_on [:users, :orders, :instruments, :plays, :parts, :conductors, :products, :events, :concerts, :news, :guestnotes], :to => [:read, :manage]
    has_permission_on :projects, :to => [:read, :manage, :manage_members]
    has_permission_on :people, :to => [:read, :manage, :autocomplete]
    
    has_permission_on :avatars, :to => [:new, :create]
    
    has_permission_on :memberships, :to => :adjust
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
  
  privilege :manage_members do
    includes :add_member, :save_member, :remove_member
  end
  
end
