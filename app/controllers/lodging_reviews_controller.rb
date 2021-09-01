class LodgingReviewsController < ApplicationController
  before_action :set_lodging_review, only: %i[ show edit update destroy ]

  # GET /lodging_reviews or /lodging_reviews.json
  def index
    @lodging_reviews = LodgingReview.all
  end

  # GET /lodging_reviews/1 or /lodging_reviews/1.json
  def show
  end

  # GET /lodging_reviews/new
  def new
    @lodging_review = LodgingReview.new

    if !session[:lodging_id] # Si es que no se ha seteado la id de la propiedad selecionada lo asignamos a una cookie
      session[:lodging_id] = params[:lodging_id]
    else
    end

    puts "Lodging_id: #{session[:lodging_id]}"
  end

  # GET /lodging_reviews/1/edit
  def edit
  end

  # POST /lodging_reviews or /lodging_reviews.json
  def create
    @lodging_review = LodgingReview.new(lodging_review_params)

    respond_to do |format|
      if @lodging_review.save
        format.html { redirect_to root_path, notice: "Lodging review was successfully created." }
        format.json { render :show, status: :created, location: @lodging_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lodging_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lodging_reviews/1 or /lodging_reviews/1.json
  def update
    respond_to do |format|
      if @lodging_review.update(lodging_review_params)
        format.html { redirect_to @lodging_review, notice: "Lodging review was successfully updated." }
        format.json { render :show, status: :ok, location: @lodging_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lodging_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lodging_reviews/1 or /lodging_reviews/1.json
  def destroy
    @lodging_review.destroy
    respond_to do |format|
      format.html { redirect_to lodging_reviews_url, notice: "Lodging review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lodging_review
      @lodging_review = LodgingReview.find(params[:id], params[:description], params[:rate])
    end

    # Only allow a list of trusted parameters through.
    def lodging_review_params
      begin
        params.require(:lodging_review).permit(:lodging_id,:description, :rate, :user_id)
      rescue
      end
    end
end
