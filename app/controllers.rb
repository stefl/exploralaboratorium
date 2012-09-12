Explora.controllers  do
  get :index, :map => "/" do
    render :"pages/home"
  end
  get :about, :map => "/about" do
    render :"pages/about"
  end
  post :create_idea, :map => "/ideas" do
    idea = Idea.create(params[:idea])
    flash[:success] = "Awesome! Thanks for your idea"
    redirect "/"
  end
end
