class SessionsController < ApplicationController
  def create
    # @user = User.find_or_create_from_auth_hash
    # session[:user_id] = @user.id
    # redirect_to :me
    @user = User.new(user_params)
      render layout: :login
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
