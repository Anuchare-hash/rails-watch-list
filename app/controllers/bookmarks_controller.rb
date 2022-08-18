class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(book_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy

    @bookmark = Bookmark.find(params[:id])

    @bookmark.destroy

    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private
  def book_params
    params.require(:bookmark).permit(:comment,:movie_id)
  end
end
