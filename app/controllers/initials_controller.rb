class InitialsController < ApplicationController
  before_action :set_initial, only: [:show, :edit, :update, :destroy]

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
    # Use callbacks to share common setup or constraints between actions.
    def set_initial
      @initial = Initial.last
      unless @initial
        @initial = Initial.create(zoom: 9, lat: 40.479863, lng: 141.562804, title: 'Wikiフィールドノート', description: 'これは八戸工業大学小久保温研究室で開発したアプリです。<br>マップ上で、自分の好きな場所を登録して、自分だけの地図を作りましょう。<br>場所を登録するには、編集モードに切り替え、マップで登録したい地点をクリックします。')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def initial_params
      params.require(:initial).permit(:zoom, :lat, :lng, :title, :description)
    end
end
