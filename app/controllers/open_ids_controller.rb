class OpenIdsController < ApplicationController
  # GET /open_ids
  # GET /open_ids.xml
  def index
    @open_ids = OpenId.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @open_ids }
    end
  end
  
  # GET /open_ids/1
  # GET /open_ids/1.xml
  def show
    @open_id = OpenId.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @open_id }
    end
  end

  # GET /open_ids/new
  # GET /open_ids/new.xml
  def new
    @open_id = OpenId.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @open_id }
    end
  end

  # GET /open_ids/1/edit
  def edit
    @open_id = OpenId.find(params[:id])
  end

  # POST /open_ids
  # POST /open_ids.xml
  def create
    @open_id = OpenId.new(params[:open_id])

    respond_to do |format|
      if @open_id.save
        flash[:notice] = 'OpenId was successfully created.'
        format.html { redirect_to(@open_id) }
        format.xml  { render :xml => @open_id, :status => :created, :location => @open_id }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @open_id.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /open_ids/1
  # PUT /open_ids/1.xml
  def update
    @open_id = OpenId.find(params[:id])

    respond_to do |format|
      if @open_id.update_attributes(params[:open_id])
        flash[:notice] = 'OpenId was successfully updated.'
        format.html { redirect_to(@open_id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @open_id.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /open_ids/1
  # DELETE /open_ids/1.xml
  def destroy
    @open_id = OpenId.find(params[:id])
    @open_id.destroy

    respond_to do |format|
      format.html { redirect_to(open_ids_url) }
      format.xml  { head :ok }
    end
  end
end