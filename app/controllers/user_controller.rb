class UserController < ApplicationController
  before_filter :authenticate_door!
  helper_method :sort_column, :sort_direction
  def index
  @chengjis_active=Chengji.where(:status=>true, :user_id=>current_door.user.id).paginate(:per_page=>3, :page=>params[:chengji]) 
  
  @chengjis_unactive=Chengji.where(:status=>false, :user_id=>current_door.user.id).paginate(:per_page=>3, :page=>params[:page]) 
  
  @posts=Post.order(sort_column + " " + sort_direction).search(params[:search]).paginate(:per_page=> 5, :page=>params[:ajax])
  
  @user=current_door.user
  @userorderintegration1=User.where(:academy=>current_door.user.academy).order("integration desc")
@userorderintegration2=User.where(:major=>current_door.user.major).order("integration desc")
# @userorderdistance1=Chengji.group("user_id").select("user_id, sum(distance) as total_distance").order("total_distance desc")
 @userorderdistance1=User.where(:academy=>current_door.user.academy).joins(:chengjis).group(:user_id).order('sum(chengjis.distance) desc')
  @userorderdistance2=User.where(:major=>current_door.user.major).joins(:chengjis).group(:user_id).order('sum(chengjis.distance) desc')
  
  if params[:search1] && params[:search2]
  @searches=Chengji.find(:all, :conditions=>['created_at >= ? and created_at <= ?', params[:search1].to_date.beginning_of_day, params[:search2].to_time.end_of_day])
  else
  @searches=Chengji.all
  end
   
  respond_to  do |format|
  format.html
  format.js
  end
  end

  def active
  @chengji=Chengji.find(params[:id])
  if @chengji.update_attributes(status: true)
   flash[:notice] = "Successfully active post."
   @chengjis_unactive=Chengji.where(:status=>false, :user_id=>current_door.user.id).paginate(:per_page=>5, :page=>params[:page]) 
   
  end
  end
  def begin
 # @chengji1=Chengji.where(:user_id=>params[:id]).date_on("2013-02-23").limit(1)
 # if @chengji1.update_attributes(status1: true)
 # flash[:notice]="success"
#  end
  respond_to do |format|
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
  def chart
  respond_to do |format|
  format.js
  end
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
