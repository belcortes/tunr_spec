require 'spec_helper'

describe ArtistsController do

  # describe 'inheritance' do
  #   it 'inherits from ApplicationController'

  # end
  describe 'collection' do
    describe 'GET #index' do
      it 'gets all of the artists' do
        artist = create(:artist)
        artist2 = create(:artist2)
        get :index
        assigns(:artists).should eq [artist, artist2]
      end
      it 'renders the :index view' do
        get :index
        response.should render_template :index
      end
    end
    describe 'GET #new' do
      let(:artist) {mock_model(Artist).as_new_record}
      before {Artist.stub(:new).and_return(artist)}

      it 'saves the given artist as an instance variable' do
        get :new
        assigns(:artist).should be_an(Artist)
        assigns(:artist).should be_new_record

      end
      it 'renders the :new view' do
        get :new
        response.should render_template :new
      end
    end

    describe 'POST #create' do
      let(:artist) {mock_model(Artist).as_null_object}

      before {Artist.stub(:new).and_return(artist)}

      context 'when save succeeds' do
        it 'saves the artist' do
          artist.should_receive(:save)
          post :create
        end
      #   it 'creates a new artist' do
      #     expect{
      #       post :create, {artist: attributes_for(:artist)} #attributes for is a factory girl method
      #       }.to change{Artist.count}.by 1
      #   end
        it 'redirects to :index' do
          post :create
          response.should redirect_to artists_path
        end
      end

      context 'when save fails' do
        it 'renders new page' do
          artist.should_receive(:save).and_return(false)
          post :create
          response.should render_template :new
        end

        # it 'does not creates a new artist' do
        #   expect{
        #     post :create, {artist: attributes_for(:invalid_artist)}
        #     }.to change{Artist.count}.by 0
        # end
        # it 're-renders the :new view' do
        #   post :create, {artist: attributes_for(:invalid_artist)}
        #   response.should render_template :new
        # end

      end
    end
  end
  describe 'member' do
    let(:artist) {create(:artist)}
    describe 'GET #edit' do
      before do
        get :edit, id: artist
      end
      it 'assigns the given artist as an instance variable' do
        assigns(:artist).should eq artist
      end
      it 'renders the :edit view' do
        response.should render_template :edit
      end
    end
    describe 'GET #show' do
      before do
        Artist.stub(:find).and_return(artist)
        get :show, id: artist
      end
      it 'shows the given artist' do
        assigns(:artist).should eq artist
      end
      it 'renders the :show view' do
        response.should render_template :show
      end
    end

    describe 'PUT #update' do
      # let(:artist) {create(:artist)}

      context 'valid attributes' do
        before {put :update, id: artist, artist: attributes_for(:artist)}
        it 'assigns the given artist to an instace variable' do
          assigns(:artist).should eq(artist)
        end
        it 'changes the attributes of the artist' do
          expect {
            put :update, id: artist, artist: attributes_for(:artist, name: 'updated name')
            artist.reload
          }.to change{artist.name}.to('updated name')
          
        end

        it 'redirects to :index/artist_id' do
          put :update, id: artist
          response.should redirect_to artist_path(artist)
        end
      end

      context 'invalid attributes' do
        before {put :update, id: artist, invalid_artist: attributes_for(:invalid_artist)}
        it 'assigns the given artist to an instace variable' do
          assigns(:artist).should eq(artist)
        end
        it 'does not change the attributes of the artist' do 
          expect {
            put :update, id: artist, invalid_artist: attributes_for(:invalid_artist, name:"Bel")
            artist.reload
          }.to_not change{artist.name}.to('Bel')
        end
        it 're-renders :edit' do
          put :update, id: artist, artist: attributes_for(:invalid_artist)
          response.should render_template :edit
        end
      end


    end

    describe 'DELETE #destroy' do

      it "deletes the artist" do 
        artist.reload
        expect{ 
          delete :destroy, id: artist 
        }.to change{Artist.count}.by -1
       end 
      it "redirects to artists#index" do 
        delete :destroy, id: artist 
        response.should redirect_to artists_path
      end 

    end

  end

end