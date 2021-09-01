class LodgingsController < ApplicationController
  before_action :set_lodging, only: %i[show edit update destroy ]



  # GET /lodgings or /lodgings.json
  def index
    #query
    # query = Lodging.search(search_params)
    # puts query
    # location, check_in, check_out

    @lodgings = Lodging.where(
      'location like ? AND
      ((end_availability >= ? AND start_availability <= ?) AND (end_availability >= ? AND start_availability <= ?))',
      "%#{params[:location]}%", params[:check_in], params[:check_in], params[:check_out], params[:check_out]).
      map{ |l| l }

    puts "QUERY:"
    @lodgings.each do |l|
      puts "id: #{l.id}, location: #{l.location}, start: #{l.start_availability}, end: #{l.end_availability}"
    end

  end

  def search_params
    params.
      # Optionally, whitelist your search parameters with permit
      permit(:location, :check_in, :check_out).
      # Delete any passed params that are nil or empty string
      delete_if {|key, value| value.blank? or value == "" }
  end

  # GET /lodgings/1 or /lodgings/1.json
  def show
    @lodging_reviews = LodgingReview.where(lodging: @lodging)
  end

  # GET /lodgings/new
  def new
    @lodging = Lodging.new
  end

  # GET /lodgings/1/edit
  def edit
  end

  # POST /lodgings or /lodgings.json
  def create
    @lodging = Lodging.new(:user_id => session[:user_id], :title => lodging_params[:title], :description => lodging_params[:description], :location => lodging_params[:location], :amenities => lodging_params[:amenities], :facilities => lodging_params[:facilities], :equipment => lodging_params[:equipment], :start_availability => lodging_params[:start_availability], :end_availability => lodging_params[:end_availability], :photo => lodging_params[:photo], :video => lodging_params[:video])

    respond_to do |format|
      if @lodging.save
        format.html { redirect_to @lodging, notice: "Lodging was successfully created." }
        format.json { render :show, status: :created, location: @lodging }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lodgings/1 or /lodgings/1.json
  def update
    respond_to do |format|
      if @lodging.update(lodging_params)
        format.html { redirect_to @lodging, notice: "Lodging was successfully updated." }
        format.json { render :show, status: :ok, location: @lodging }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lodgings/1 or /lodgings/1.json
  def destroy
    @lodging.destroy
    respond_to do |format|
      format.html { redirect_to lodgings_url, notice: "Lodging was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lodging
      @lodging = Lodging.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lodging_params
      begin
        params.require(:lodging).permit(:title, :description, :location, :amenities, :facilities, :equipment, :start_availability, :end_availability, :photo, :video)
      rescue
      end
    end
end
