Trestle.resource(:users, model: User, scope: Auth) do
  menu do
    group :configuration, priority: :last do
      item :users, icon: "fas fa-users"
    end
  end
  active_storage_fields do
    [:avatar_url]
  end

  form do |user|
    text_field :first_name
    text_field :last_name
    active_storage_field :avatar_url
  end
  table do
    column :avatar_url, header: false do |user|
      avatar_for(user)
    end
    column :email, link: true
    column :first_name
    column :last_name
    actions do |a|
      a.delete unless a.instance == current_user
    end
  end
  form do |user|
    
    row  do
      col(sm: 3) { image_tag("#{user.avatar_url} ")  }
      col(sm: 3) { text_field :email }
      col(sm: 3) { text_field :first_name }
      col(sm: 3) { text_field :last_name }
      col(sm: 3) { text_field :avatar_url } 
      col(sm: 4) { password_field :password }
      col(sm: 5) { password_field :password_confirmation }
    end

  end
  collection do
    User.order(first_name: :asc)
  end

  search do |query|
    query ? collection.where("first_name LIKE ?","%" + query + "%" ) : collection
  end
end



Trestle.resource(:musics) do
  # Add a link to this admin in the main navigation
  menu do
    group :Music  do
      item :Musics, icon: "fa fa-music"
    end
  end
  collection do
    Music.order(band: :asc)
  end
  search do |query|
    query ? collection.where("band LIKE ?","%" + query + "%" ) : collection
  end
end

Trestle.resource(:movies) do
  # Add a link to this admin in the main navigation
  menu do
    group :Movie do
      item :Movies, icon: "fa fa-film "
    end
  end
  collection do
    Movie.order(title: :asc)
  end
  search do |query|
    query ? collection.where("title LIKE ?","%" + query + "%" ) : collection
  end
end

