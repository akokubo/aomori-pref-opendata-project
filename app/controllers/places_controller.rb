class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
      if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "places/show"
    end
  end

  # GET /places/new
  def new
    @place = Place.new
    @place.build_image
    @place.lat = params[:lat]
    @place.lng = params[:lng]
  end

  # GET /places/1/edit
  def edit
    @place.build_image unless @place.image
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to map_url }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    if params[:place][:image_attributes]['_destroy'] == 1
      @place.image.destroy
    end
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to map_url }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to map_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :lat, :lng, :description, image_attributes: [:uploaded_image])
    end

    # 画像送信
    def send_image
      if @place.image.present? && @place.image.data != nil
        send_data @place.image.data, type: @place.image.content_type, disposition: "inline"
      else
        raise NotFount
      end
    end
end
