class NavigationScreen < PM::TableScreen
  def on_load
  end

  def table_data
    [{
      title: nil,
      cells: [
        { title: "" },
        {
          title: sign_in_out_title,
          action: :sign_in_out_button
        }
      ]
    }]
  end

  def sign_in_out_title
    if Auth.signed_in?
      "Logout"
    else
      "Sign In"
    end
  end

  def sign_in_out_button
    if Auth.signed_in?
      sign_out_button
    else
      sign_in_button
    end
  end

  def sign_in_button
    open SignInScreen.new(nav_bar: true)
  end

  def sign_out_button
    Auth.sign_out do
      app.delegate.open_authenticated_root
    end
  end

  def swap_center_controller(screen_class)
    # Just use screen_class if you don't need a navigation bar
    app_delegate.menu.center_controller = screen_class
  end

  def will_animate_rotate(_orientation, _duration)
    reapply_styles
  end
end
