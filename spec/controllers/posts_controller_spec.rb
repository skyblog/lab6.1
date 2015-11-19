require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
	before(:all) do 
		Post.new(title: 'My title', content: 'My content') 
	end 

	let(:valid_attributes) {{}}

  	let(:valid_session) { {} }

	context '#index' do

		it "has a 200 status code" do
      		get :index
      		expect(response.status).to eq(200)
    	end

		it 'assigns all posts as @posts' do
			@posts = Post.all
			get :index
			expect(assigns(:posts)).to eq(@posts)
		end

		it 'renders the index page' do
			get :index
			expect(response).to render_template("index")
		end

	end

	context '#new' do

		it 'assigns a new post as @post' do
			get :new
			expect(assigns(:post)).to be_a_new(Post)
		end

		it 'renders the new page' do
			get :new
			expect(response).to render_template("new")
		end

	end

	context '#create' do

		
      	it "creates a new Post" do
	    	expect { post :create, {:post => valid_attributes}, valid_session }.to change(Post, :count).by(1)
      	end

      	it "assigns a newly created post as @post" do
        	post :create, {:post => valid_attributes}, valid_session
        	expect(assigns(:post)).to be_a(Post)
        	expect(assigns(:post)).to be_persisted
      	end

      	it "redirects to the created post" do
        	post :create, {:post => valid_attributes}, valid_session
        	expect(response).to redirect_to(Post.last)
      	end
	end

	context '#destory' do

		before :each do
        	@post = Post.create!
      	end

		it 'destroys the requested post' do
			expect { delete :destroy, id: @post}.to change(Post, :count).by(-1)
		end

		it 'redirects to the posts list' do
			delete :destroy, id: @post
			expect(response).to redirect_to(posts_path)
		end

	end
end
