Gitlog.controllers  do
  get :index, map: "/" do
    @log_items = LogItem.all.order_by([:created_at, :desc])
    render "log_items/index"
  end

  post :receive_payload, map: "/payload" do
    payload = JSON.parse(params[:payload])
    LogItem.create_from_payload(payload)
    return "OK"
  end
end
