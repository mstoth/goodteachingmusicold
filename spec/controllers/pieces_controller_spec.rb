require 'spec_helper'

describe PiecesController do
  
  describe "GET #index" do
    it "populates an array of pieces" do
      piece = create(:piece)
      get :index
      expect(assigns(:pieces)).to match_array [piece]
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe "Get #show" do
    it 'assigns the requested piece to @piece' do
      piece = create(:piece)
      get :show, id: piece
      expect(assigns(:piece)).to eq piece
    end
    it 'renders the :show template' do
      piece = create(:piece)
      get :show, id: piece
      expect(response).to render_template(:show)
    end
  end
  
  describe "Get #new" do
    it "assigns a new piece to @piece" do
      get :new
      expect(assigns(:piece)).to be_a_new(Piece)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe 'GET #edit' do
    it 'assigns the requested piece to @piece' do
      piece = create(:piece)
      get :edit, id: piece
      expect(assigns(:piece)).to eq piece
    end
    it 'renders the :edit template' do
      piece = create(:piece)
      get :edit, id: piece
      expect(response).to render_template :edit 
    end
  end
  
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new piece in the database' do
        expect{
          post :create, piece: attributes_for(:piece)
        }.to change(Piece, :count).by(1)
      end
      
      it 'redirects to the home page' do
        post :create, piece: attributes_for(:piece)
        expect(response).to redirect_to root_url
      end
    end
  end
  
  describe 'DELETE #destroy' do
    it 'removes the piece from the database' do
      @piece = create(:piece)
      expect{
        delete :destroy, id: @piece
      }.to change(Piece, :count).by(-1)
    end
  end
  
  describe 'PUT #update' do
    before :each do
      @piece = create(:piece)
    end
    
    it "locates the requested @piece" do
      put :update, id: @piece, piece: attributes_for(:piece)
      expect(assigns(:piece)).to eq(@piece)
    end
    
    context "valid attributes" do
      it "changes @piece's attributes" do
        put :update, id: @piece, piece: attributes_for(:piece, title: "Prelude") 
        @piece.reload
        expect(@piece.title).to eq("Prelude")
      end
      
      it "redirects to the updated piece" do
        put :update, id: @piece, piece: attributes_for(:piece)
        expect(response).to redirect_to @piece
      end
    end
  end
  
end
