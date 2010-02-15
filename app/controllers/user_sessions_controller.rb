class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        flash[:notice] = 'Successfully Logged In.'
        format.html { redirect_to(current_user) }
        format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    respond_to do |format|
      flash[:notice] = 'Successfully Logged In.'      
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end
end
