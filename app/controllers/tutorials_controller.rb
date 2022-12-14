class TutorialsController < ApplicationController
  before_action :set_tutorial, only: %i[ show edit update destroy upvote downvote]

  # GET /tutorials or /tutorials.json
  def index
    if (params[:query])
      @tutorials = Tutorial.where('lower(author) LIKE ? OR lower(title) LIKE ? OR lower(description) LIKE ? OR lower(body) LIKE ?', "#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @tutorials = Tutorial.all
    end
  end

  # GET /tutorials/1 or /tutorials/1.json
  def show
  end

  # GET /tutorials/new
  def new
    @tutorial = Tutorial.new
  end

  # GET /tutorials/1/edit
  def edit
  end

  # POST /tutorials or /tutorials.json
  def create
    @tutorial = Tutorial.new(tutorial_params)
    @tutorial.category =  @tutorial.category.downcase.gsub(/\s+/, "")
    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to tutorial_url(@tutorial), notice: "Tutorial was successfully created." }
        format.json { render :show, status: :created, location: @tutorial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorials/1 or /tutorials/1.json
  def update
    respond_to do |format|
      formatted_tutorial_params = tutorial_params
      formatted_tutorial_params[:category] = formatted_tutorial_params[:category].downcase.gsub(/\s+/, "")
      if @tutorial.update(formatted_tutorial_params)
        format.html { redirect_to tutorial_url(@tutorial), notice: "Tutorial was successfully updated." }
        format.json { render :show, status: :ok, location: @tutorial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1 or /tutorials/1.json
  def destroy
    @tutorial.destroy

    respond_to do |format|
      format.html { redirect_to tutorials_url, notice: "Tutorial was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def list_by_category
    @tutorials = Tutorial.where(category: params[:category])
  end
  def list_by_author
    @tutorials = Tutorial.where('lower(author) LIKE ?', "%#{params[:author]}%")
  end

  def upvote
    upvotes = @tutorial.upvotes + 1
    @tutorial.update(upvotes: upvotes)
    render partial: "upvotes", locals: {upvotes: upvotes}, status: :ok
  end
  def downvote
    downvotes = @tutorial.downvotes + 1
    @tutorial.update(downvotes: downvotes)
    render partial: "downvotes", locals: {downvotes: downvotes}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutorial_params
      params.require(:tutorial).permit(:category, :author, :title, :description, :body, :upvotes, :downvotes)
    end
end
