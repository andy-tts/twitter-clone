class HootsController < ApplicationController
  before_action :set_hoot, only: [:show, :edit, :update, :destroy]

  # GET /hoots
  # GET /hoots.json
  def index
    @hoots = Hoot.all
  end

  # GET /hoots/1
  # GET /hoots/1.json
  def show
  end

  # GET /hoots/new
  def new
    @hoot = Hoot.new
  end

  # GET /hoots/1/edit
  def edit
  end

  # POST /hoots
  # POST /hoots.json
  def create
    @hoot = Hoot.new(hoot_params)

    respond_to do |format|
      if @hoot.save
        format.html { redirect_to @hoot, notice: 'Hoot was successfully created.' }
        format.json { render :show, status: :created, location: @hoot }
      else
        format.html { render :new }
        format.json { render json: @hoot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hoots/1
  # PATCH/PUT /hoots/1.json
  def update
    respond_to do |format|
      if @hoot.update(hoot_params)
        format.html { redirect_to @hoot, notice: 'Hoot was successfully updated.' }
        format.json { render :show, status: :ok, location: @hoot }
      else
        format.html { render :edit }
        format.json { render json: @hoot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hoots/1
  # DELETE /hoots/1.json
  def destroy
    @hoot.destroy
    respond_to do |format|
      format.html { redirect_to hoots_url, notice: 'Hoot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hoot
      @hoot = Hoot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hoot_params
      params.require(:hoot).permit(:message, :user_id)
    end
end
