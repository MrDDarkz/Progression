class BarsController < ApplicationController
  before_action :set_bar, only: %i[ show edit update destroy ]

  # GET /bars or /bars.json
  def index
    @bars = Bar.all
  end

  # GET /bars/1 or /bars/1.json
  def show
  end

  # GET /bars/new
  def new
    @bar = Bar.new
  end

  # GET /bars/1/edit
  def edit
  end

  # POST /bars or /bars.json
  def create
    @bar = Bar.new(bar_params)

    respond_to do |format|
      if @bar.save
        format.html { redirect_to @bar, notice: "Bar was successfully created." }
        format.json { render :show, status: :created, location: @bar }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @bar.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /bars/1 or /bars/1.json
  def update
    respond_to do |format|
      if @bar.update(bar_params)
        format.html { redirect_to @bar, notice: "Bar was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @bar }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @bar.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /bars/1 or /bars/1.json
  def destroy
    @bar.destroy!

    respond_to do |format|
      format.html { redirect_to bars_path, notice: "Bar was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar
      @bar = Bar.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def bar_params
      params.expect(bar: [ :name, :progress, :goal ])
    end
end
