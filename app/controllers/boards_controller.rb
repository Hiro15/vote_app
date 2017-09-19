class BoardsController < ApplicationController
  def view
    @text = Board.new
    @comments = Board.all
  end

  def create
    body = params[:body]
    @text = Board.new(body:body,name:current_user.name,name_id:current_user.id)
  if @text.save
    redirect_to boards_view_path
  else
    flash[:denger] = '投稿エラーです'
    redirect_to boards_view_path

  end
  end

   def page
     @comments = Board.where(name_id:current_user.id)
   end

  def destroy
    @text = Board.find(params[:format])
    @text.destroy
    flash[:success] = '退会しました'
    redirect_to boards_view_path
  end

  private
end
