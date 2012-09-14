Explora.controllers  do
  get :index, :map => "/" do
    render :"pages/home"
  end
  get :faq, :map => "/faq" do
    render :"pages/faq"
  end
  post :create_idea, :map => "/ideas" do
    idea = Idea.create(params[:idea])
    flash[:success] = "Awesome! Thanks for your idea"
    redirect "/"
  end
end
