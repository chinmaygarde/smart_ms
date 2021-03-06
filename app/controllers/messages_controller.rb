class MessagesController < ApplicationController
	
	before_filter :authorize
	
  # GET /messages
  # GET /messages.xml
  def index
  	
  	if params[:user_id]
  		@messages = Message.find_all_by_user_id(params[:user_id])
  	elsif params[:conversation_id]
  		conversation = Conversation.find(params[:conversation_id])
  		@messages = conversation.messages
  	else
  		@messages = []
  	end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new
    @message.user_id = params[:user_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])
    @message.user_id = params[:user_id]
    
    conversation = Conversation.find_by_user_id_and_with_number(@message.user_id, @message.from_number)
    
    unless conversation
    	conversation = Conversation.create(:user_id => @message.user_id, :title => "Conversation with #{@message.from_number}", :with_number => @message.from_number)
    end
    conversation.messages << @message
    
    respond_to do |format|
      if @message.save
        flash[:notice] = 'Message was successfully created.'
        format.html { redirect_to([@message.user,@message]) }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        flash[:notice] = 'Message was successfully updated.'
        format.html { redirect_to([@message.user, @message]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(user_path(params[:user_id])) }
      format.xml  { head :ok }
    end
  end
end
