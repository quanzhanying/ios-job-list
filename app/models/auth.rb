class Auth < Motion::Authentication
  strategy DeviseTokenAuth
  sign_in_url "http://localhost:3000/users/sign_in"
end
