require 'spec_helper'

describe PiecesController do

  def mock_piece(stubs={})
    (@mock_piece ||= mock_model(Piece).as_null_object).tap do |piece|
      piece.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all pieces as @pieces" do
      Piece.stub(:all) { [mock_piece] }
      get :index
      assigns(:pieces).should eq([mock_piece])
    end
  end

  describe "GET show" do
    it "assigns the requested piece as @piece" do
      Piece.stub(:find).with("37") { mock_piece }
      get :show, :id => "37"
      assigns(:piece).should be(mock_piece)
    end
  end

  describe "GET new" do
    it "assigns a new piece as @piece" do
      Piece.stub(:new) { mock_piece }
      get :new
      assigns(:piece).should be(mock_piece)
    end
  end

  describe "GET edit" do
    it "assigns the requested piece as @piece" do
      Piece.stub(:find).with("37") { mock_piece }
      get :edit, :id => "37"
      assigns(:piece).should be(mock_piece)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created piece as @piece" do
        Piece.stub(:new).with({'these' => 'params'}) { mock_piece(:save => true) }
        post :create, :piece => {'these' => 'params'}
        assigns(:piece).should be(mock_piece)
      end

      it "redirects to the created piece" do
        Piece.stub(:new) { mock_piece(:save => true) }
        post :create, :piece => {}
        response.should redirect_to(piece_url(mock_piece))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved piece as @piece" do
        Piece.stub(:new).with({'these' => 'params'}) { mock_piece(:save => false) }
        post :create, :piece => {'these' => 'params'}
        assigns(:piece).should be(mock_piece)
      end

      it "re-renders the 'new' template" do
        Piece.stub(:new) { mock_piece(:save => false) }
        post :create, :piece => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested piece" do
        Piece.should_receive(:find).with("37") { mock_piece }
        mock_piece.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :piece => {'these' => 'params'}
      end

      it "assigns the requested piece as @piece" do
        Piece.stub(:find) { mock_piece(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:piece).should be(mock_piece)
      end

      it "redirects to the piece" do
        Piece.stub(:find) { mock_piece(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(piece_url(mock_piece))
      end
    end

    describe "with invalid params" do
      it "assigns the piece as @piece" do
        Piece.stub(:find) { mock_piece(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:piece).should be(mock_piece)
      end

      it "re-renders the 'edit' template" do
        Piece.stub(:find) { mock_piece(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested piece" do
      Piece.should_receive(:find).with("37") { mock_piece }
      mock_piece.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pieces list" do
      Piece.stub(:find) { mock_piece }
      delete :destroy, :id => "1"
      response.should redirect_to(pieces_url)
    end
  end

end
