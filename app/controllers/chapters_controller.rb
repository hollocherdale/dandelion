class ChaptersController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :show, :about, :new]
  before_action :set_chapter, except: [:new, :create, :about, :seed, :create_seed]

  def index
    @chapters = Chapter.scoped
  end

  def new
    @chapter = Chapter.new
    @parent = Chapter.find(params[:id])
    if @parent.accepting_submissions? || @parent.populated?
      @submissions = Chapter.find(params[:id]).children
    else
      redirect_to root_url
      flash[:error] = 'Sorry, that chapter is already populated.'
    end
  end

  def show
    @chapter_submissions = Chapter.find(params[:id]).children
    @chapter_choices = @chapter.children.with_states('accepting_submissions', 'populated', 'popular', 'closed')
  end

  def create
    @chapter = current_user.chapters.build(chapter_params)
    respond_to do |format|
      if @chapter.save
        @chapter.parent.populate if @chapter.is_only_child?
        format.html { redirect_to @chapter.parent, notice: 'Chapter was successfully created.' }
        format.js   {}
      else
        format.html { render action: 'new' }
      end
    end
  end

  def create_seed
    @chapter = current_user.chapters.build(chapter_params)
    if @chapter.save
      @chapter.publish
      redirect_to @chapter
    else
      flash[:error] = 'Something broke!'
    end
  end

  def seed
    @chapter = Chapter.new
  end

  def edit
    @upload = Upload.new
  end

  def destroy
    @chapter.parent.unpopulate if @chapter.is_only_child?
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js   {}
    end
  end

  def upvote
    if request.post?
      @chapter.liked_by current_user
    elsif request.delete?
      @chapter.unliked_by current_user
    end
  end

  def downvote
    if request.post?
      @chapter.disliked_by current_user
    elsif request.delete?
      @chapter.undisliked_by current_user
    end
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:story, :choice, :parent_id, :user_id, :book_id, :upload, :image)
  end
end
