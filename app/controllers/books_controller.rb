class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :destroy]

  def home
    @books = Book.all
    @top_submissions = Chapter.where(state: 'pending').order(vote_count: :desc)
    @popular_chapters = Chapter.where(state: 'popular').order(vote_count: :desc)
    @unpopulated_chapters = Chapter.where(state: 'accepting_submissions').order(vote_count: :desc)
    @home = true
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to @book
    else
      redirect_to new_book_path
      flash[:error] = 'Something broke!'
    end
  end

  def show
    if @book.has_no_seed
      redirect_to seed_new_chapter_path(:id => @book.id)
    else
      redirect_to @book.first_chapter
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @book.destroy
    redirect_to :root
  end

  def new
    @book = Book.new
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:banner, :title)
  end
end
