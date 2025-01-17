class BookmarksController < ApplicationController
  before_action :set_list
  before_action :set_bookmark, only: [:destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark was successfully deleted.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = @list.bookmarks.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
