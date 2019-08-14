json.data do 
  json.paginate_meta do
    paginate_meta_attributes(json, @microposts)
  end
  json.microposts do
    json.array! @microposts do |micropost|
      json.(micropost, :id, :title, :content)
    end
  end
end

json.code response.status
json.message 'success'


