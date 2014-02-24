class DesignsController < ApplicationController
  before_action :set_design, only: [:show, :edit, :update, :destroy]

  # GET /designs
  # GET /designs.json
  def index
    @designs = Design.all
  end

  # GET /designs/1
  # GET /designs/1.json
  def show
  end

  # GET /designs/new
  def new
    @design = Design.new
  end

  # GET /designs/1/edit
  def edit
  end

  # POST /designs
  # POST /designs.json
  def create
    @design = Design.new(design_params)

    # shopify(@design)

    respond_to do |format|
      if @design.save
        format.html { redirect_to @design, notice: 'Design was successfully created.' }
        format.json { render action: 'show', status: :created, location: @design }
      else
        format.html { render action: 'new' }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /designs/1
  # PATCH/PUT /designs/1.json
  def update
    respond_to do |format|
      if @design.update(design_params)
        format.html { redirect_to @design, notice: 'Design was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designs/1
  # DELETE /designs/1.json
  def destroy
    @design.destroy
    respond_to do |format|
      format.html { redirect_to designs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_design
      @design = Design.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def design_params
      params.require(:design).permit(:image, :slug, :title, :description)
    end
end
