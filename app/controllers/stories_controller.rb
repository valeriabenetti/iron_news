class StoriesController < ApplicationController
  # GET /stories
  before_action :authorize!, except: [:index]
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

    unless @story.created_by == current_user
      redirect_to stories_path, notice: "You must of have written this article in order to edit."
      return
    end
  end

  # POST /stories
  def create
    @story = Story.new(story_params)
    @story.created_by = current_user

    if @story.save
      redirect_to @story, notice: 'Article has been successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stories/1
  def update
    @story = Story.find(params[:id])

    unless @story.created_by == current_user
      redirect_to @story, notice: 'Article has been successfully created.'
      return
    end

    if @story.update(story_params)
      redirect_to @story, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stories/1
  def destroy
    @story = Story.find(params[:id])

    unless @story.created_by == current_user
      redirect_to stories_path, notice: 'You must of have written this article in order to delete.'
      return
    end

    @story.destroy
    redirect_to stories_url, notice: 'Article was successfully destroyed.'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def story_params
    params.require(:story).permit(:title, :url, :email)
  end
end
