class UserController < ApplicationController
  before_filter :authenticate_door!
  helper_method :sort_column, :sort_direction
  def index
  
  @posts=Post.order(sort_column + " " + sort_direction).search(params[:search]).paginate(:per_page=> 5, :page=>params[:page])
  @user=User.first 
   
  respond_to  do |format|
  format.html
  format.js
  end
  end
  def show
  end
  def edit
  @product=Product.find(params[:id])
  @user=User.find(params[:id])
  respond_to do |format|
  format.html
  format.js
  end
  end
  def update
  @user=User.find(params[:id])
  @user.update_attributes(params[:user])
  respond_to do |format|
  format.html
  format.js
  end
  end
  def destroy
  end
  def new
  end
  private
  def sort_column
  # params[:sort] || "id"
  Post.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  def sort_direction
  # params[:direction] || "asc"
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
