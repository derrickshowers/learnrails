class PinsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :updateLikes, :show]
  
  # GET /pins
  # GET /pins.json
  def index
    @pins = Pin.all
    @pin = current_user.pins.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pins }
    end
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
    @pin = Pin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pin }
    end
  end

  # GET /pins/new
  # GET /pins/new.json
  def new
    @pin = current_user.pins.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pin }
    end
  end

  # GET /pins/1/edit
  def edit
    @pin = current_user.pins.find(params[:id])
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = current_user.pins.new(params[:pin])
    @pin["likes"] = 0

    respond_to do |format|
      if @pin.save
        format.html { redirect_to action: 'index', notice: 'Pin was successfully created.' }
        format.json { render json: @pin, status: :created, location: @pin }
      else
        format.html { render action: "new" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pins/1
  # PUT /pins/1.json
  def update
    @pin = current_user.pins.find(params[:id])
    @pin["likes"] = 0

    respond_to do |format|
      if @pin.update_attributes(params[:pin])
        format.html { redirect_to action: 'index', notice: 'Pin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def updateLikes
    @pin = Pin.find(params[:id])
    
    if params[:like]
    	@pin["likes"] += 1
    	Like.create(:user_id => current_user.id,:pin_id => params[:id])
    else
    	@pin["likes"] -= 1
    	destroyLike = Like.where(:user_id => current_user.id, :pin_id => params[:id])
    	destroyLike.each { |o| o.destroy }
    end

    respond_to do |format|
      if @pin.update_attributes(params[:pin])
        format.json { head :no_content }
      else
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin = current_user.pins.find(params[:id])
    @pin.destroy

    respond_to do |format|
      format.html { redirect_to pins_url }
      format.json { head :no_content }
    end
  end
end
