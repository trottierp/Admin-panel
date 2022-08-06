Trestle.resource(:account, model: User, scope: Auth, singular: true) do
  instance do
    current_user
  end
  active_storage_fields do
    [:avatar_url]
  end

  form do |user|
    text_field :first_name
    text_field :last_name
    active_storage_field :avatar_url
  end

  remove_action :new, :edit, :destroy
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

  # Limit the parameters that are permitted to be updated by the user
  params do |params|
    params.require(:account).permit(:email, :first_name, :last_name, :password, :password_confirmation, :avatar_url)
  end
end
