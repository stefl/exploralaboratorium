Explora.controllers  do
  get :index, :map => "/", :cache => true do
    expires_in 300
    render :"pages/home"
  end
  get :faq, :map => "/faq", :cache => true do
    expires_in 300
    render :"pages/faq"
  end
  post :create_idea, :map => "/ideas" do
    idea = Idea.create(params[:idea])
    flash[:success] = "Awesome! Thanks for your idea"
    redirect "/"
  end

  get :updates, :map => "/updates" do
    @updates = Update.all
    render :"updates/index"
  end

end
