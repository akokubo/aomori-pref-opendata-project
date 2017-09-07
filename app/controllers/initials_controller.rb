class InitialsController < ApplicationController

  # GET /initial
  # GET /initial.json
  def show
  end

  # GET /initial/edit
  def edit
  end

  # PATCH/PUT /initial
  # PATCH/PUT /initial.json
  def update
    respond_to do |format|
      if @initial.update(initial_params)
        format.html { redirect_to initial_url, notice: '設定が変更されました' }
        format.json { render :show, status: :ok, location: @initial }
      else
        format.html { render :edit }
        format.json { render json: @initial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /initials
  # DELETE /initials.json
  def destroy
    @initial.destroy if @initial.present?
    set_initial
    respond_to do |format|
      format.html { redirect_to initial_url, notice: '設定を初期化しました' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def initial_params
      params.require(:initial).permit(:zoom, :lat, :lng, :title, :description)
    end
end
