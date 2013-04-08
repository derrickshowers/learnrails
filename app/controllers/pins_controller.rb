class PinsController < ApplicationController
  before_filter :authenticate_user!, except: [:updateLikes, :show]
  
  # GET /pins
  # GET /pins.json
  def index
    @myPins = current_user.pins.all
    @otherPins = Pin.where(['user_id <> ?', current_user.id])
    @pin = current_user.pins.new
    @likedPins = User.find(current_user.id).likes;

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
    @pin["like_count"] = 0

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
    @pin["like_count"] = 0

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
  
  def updateLikes
  	@pin = Pin.find(params[:id])
  	
  	if Like.where(:user_id => current_user.id,:pin_id => params[:id]).count > 0
  		@like = Like.where(:user_id => current_user.id,:pin_id => params[:id])
  		@like.update_all(:rating => (params[:like]) ? 1 : -1)
  	else
  		@like = Like.new
  		@like.user_id = current_user.id
  		@like.pin_id = params[:id]
  		@like.rating = (params[:like]) ? 1 : -1
  		@like.save
  	end
  	
  	@pin["like_count"] = Like.where(:pin_id => params[:id], :rating => 1).count
  	
    respond_to do |format|
      if @pin.update_attributes(params[:pin])
        format.json { head :no_content }
      else
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
