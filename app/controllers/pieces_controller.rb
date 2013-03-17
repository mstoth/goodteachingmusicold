class PiecesController < ApplicationController
    
  # GET /pieces
  # GET /pieces.json
  def index
    if !params['instrument'].nil?
      @pieces = Piece.where(:instrument=>params['instrument'])
    else
      @pieces = Piece.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pieces }
      format.xml { render xml: @pieces }
    end
  end

  # GET /pieces/1
  # GET /pieces/1.json
  def show
    @piece = Piece.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @piece }
    end
  end

  # GET /pieces/new
  # GET /pieces/new.json
  def new
    @piece = Piece.new
    if !params["mobile"].nil? 
      @mobile = true
    else
      @mobile = false
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @piece }
    end
  end

  # GET /pieces/1/edit
  def edit
    @piece = Piece.find(params[:id])
  end

  # POST /pieces
  # POST /pieces.json
  def create
    @piece = Piece.new(params[:piece])
    if !params["mobile"].nil? 
      @mobile = true
    else
      @mobile = false
    end
    respond_to do |format|
      if @piece.save
        if !@mobile
          format.html { redirect_to @piece, notice: 'Piece was successfully created.' }
          format.json { render json: @piece, status: :created, location: @piece }
        else
          format.html { redirect_to '/pieces/new?mobile=yes', notice: 'Piece was successfully created' }
        end
      else
        format.html { render action: "new", notice: 'Piece was successfully created.' }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pieces/1
  # PUT /pieces/1.json
  def update
    @piece = Piece.find(params[:id])

    respond_to do |format|
      if @piece.update_attributes(params[:piece])
        format.html { redirect_to @piece, notice: 'Piece was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pieces/1
  # DELETE /pieces/1.json
  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy

    respond_to do |format|
      format.html { redirect_to pieces_url }
      format.json { head :no_content }
    end
  end
end

