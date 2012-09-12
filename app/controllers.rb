Explora.controllers  do
  get :index, :map => "/" do
    render :"pages/home"
  end
  get :about, :map => "/about" do
    render :"pages/about"
  end
end
