class TutesController < ApplicationController

  helper_method :sort_column, :sort_direction

  # GET /tutes
  # GET /tutes.json
  def index
    #@tutes = Tute.all.page(params[:page]).per(10)
    @search = params[:tute][:search] if params[:tute].present?
    @type = params[:type] 
    @tutes = Tute.order(sort_column + " " + sort_direction).find(:all, :conditions => ["( tutes.title LIKE ? OR tutes.episode LIKE ? OR tutes.general_type LIKE ?) #{@type.present? ? "AND general_type = '#{@type}'" : ""}", "%#{@search.to_s.downcase}%", "%#{@search.to_s.downcase}%", "%#{@search.to_s.downcase}%"])
    #@tutes = Tute.order(sort_column + " " + sort_direction).all
    @tutes = Kaminari.paginate_array(@tutes).page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tutes }
    end
  end

  # GET /tutes/1
  # GET /tutes/1.json
  def show
    @tute = Tute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tute }
    end
  end

  # GET /tutes/new
  # GET /tutes/new.json
  def new
    @tute = Tute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tute }
    end
  end

  # GET /tutes/1/edit
  def edit
    @tute = Tute.find(params[:id])
  end

  # POST /tutes
  # POST /tutes.json
  def create
    @tute = Tute.new(params[:tute])

    respond_to do |format|
      if @tute.save
        format.html { redirect_to @tute, notice: 'Tute was successfully created.' }
        format.json { render json: @tute, status: :created, location: @tute }
      else
        format.html { render action: "new" }
        format.json { render json: @tute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tutes/1
  # PUT /tutes/1.json
  def update
    @tute = Tute.find(params[:id])

    respond_to do |format|
      if @tute.update_attributes(params[:tute])
        format.html { redirect_to @tute, notice: 'Tute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutes/1
  # DELETE /tutes/1.json
  def destroy
    @tute = Tute.find(params[:id])
    @tute.destroy

    respond_to do |format|
      format.html { redirect_to tutes_url }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    Tute.column_names.include?(params[:sort]) ? params[:sort] : "episode"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
