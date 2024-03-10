users_list = [
  {username: "teacher", password: "123"},
  {username: "student", password: "123"}
]

users_list.each do |user_params|
  saved_user = User.create(user_params)
  saved_user.add_role(user_params[:username].to_sym)
end
