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
    @books = Book.create( book_params )
    redirect_to :root
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @book.destroy
    redirect_to @book
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
