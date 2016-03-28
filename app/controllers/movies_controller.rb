class MoviesController < ApplicationController

def index
end

def show
end

def new
end

def create
  @movie = Movie.new(listing_params)

  respond_to do |format|
    if @movie.save
      format.html { redirect_to @movie, notice: 'Listing was successfully created.' }
      format.json { render :show, status: :created, location: @movie }
    else
      format.html { render :new }
      format.json { render json: @movie.errors, status: :unprocessable_entity }
    end
  end

end


def edit
end

def update
  respond_to do |format|
    if @movie.update(listing_params)
      format.html { redirect_to @movie notice: 'Listing was successfully updated.' }
      format.json { render :show, status: :ok, location: @movie }
    else
      format.html { render :edit }
      format.json { render json: @movie.errors, status: :unprocessable_entity }
    

end

private
  # Use callbacks to share common setup or constraints between actions.
  def movie_listing
    @movie = Movie.find(params[:id])
  end
​
  # Never trust parameters from the scary internet, only allow the white list through.
  def movie_params
    params.require(:listing).permit(:title, :summary, :youtube_embeded_id, :thumbnail)
  end
end



end
