class StoriesController < ApplicationController
  # GET /stories
  def index
    @stories = Story.all.sort_by { |obj| obj.created_at }.reverse
  end

  # GET /stories/1
  def show
    @story = Story.find(params[:id])
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  def create
    @story = Story.new(story_params)

    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stories/1
  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stories/1
  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_url, notice: 'Story was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def story_params
      params.require(:story).permit(:title, :url, :email)
    end
end
