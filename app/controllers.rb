Gitlog.controllers  do
  post :receive_payload, map: "/payload" do
    payload = JSON.parse(params[:payload])
    LogItem.create_from_payload(payload)
    return "OK"
  end
end
