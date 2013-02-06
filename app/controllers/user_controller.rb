class UserController < ApplicationController
  def index
  @user=User.first
  end
  def show
  end
  def edit
  @product=Product.find(params[:id]);
  end
  def update
  end
  def destroy
  end
  def new
  end
end
