if response.status == 200
  json.session do
    json.(@user, :id, :name, :admin)
    json.token @user.authentication_token
  end
  
  json.code response.status
  json.message 'success'
else
  json.code response.status
  json.message '用户名或密码错误！'
end
