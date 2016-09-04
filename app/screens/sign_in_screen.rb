class SignInScreen < PM::XLFormScreen
  title "Sign In"
  stylesheet SignInScreenStylesheet

  def form_data
    [
      {
        cells: [
          {
            title:       "Email",
            name:        :email,
            type:        :email,
            placeholder: "Enter your email",
            required:    true
          },
          {
            title:       "Password",
            name:        :password,
            type:        :password,
            placeholder: "Enter your password",
            required:    true
          },
          {
            title: "Sign In",
            name: :save,
            type: :button,
            on_click: lambda do |_cell|
              authenticate
            end
          }
        ]
      }
    ]
  end

  def authenticate
    Auth.sign_in(email: values["email"], password: values["password"]) do |response|
      if response.success?
        ApiClient.update_authorization_header(Auth.authorization_header)
        app.delegate.open_authenticated_root
      elsif response.object
        app.alert response.object["error"]
      else
        app.alert "Sorry, there was an error. #{response.error.localizedDescription}"
      end
    end
  end

  def will_animate_rotate(_orientation, _duration)
    reapply_styles
  end
end
