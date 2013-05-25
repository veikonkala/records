class RecordsController < ApplicationController
  # GET /records
  # GET /records.json
  def index
    sort = case params['sort']
           when "artist"  then "artist"
           when "name"   then "name"
           when "genre" then "genre"
           when "year"  then "year"
           when "inc"   then "inc"
           when "label" then "label"
	   when "added" then "added"
           when "artist_reverse"  then "artist DESC"
           when "name_reverse"   then "name DESC"
           when "genre_reverse" then "genre DESC"
           when "year_reverse"  then "year DESC"
           when "inc_reverse"   then "inc DESC"
           when "label_reverse" then "label DESC"
           when "added_reverse" then "added DESC"
           end
    @records = Record.find(:all, :order => "artist")
    @total = Record.count

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @records }
      format.xml { render :xml => @records }
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @record }
    end
  end

  # GET /records/new
  # GET /records/new.json
  def new
    @record = Record.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @record }
    end
  end

  # GET /records/1/edit
  def edit
    @record = Record.find(params[:id])
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(params[:record])

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, :notice => 'Record was successfully created.' }
        format.json { render :json => @record, :status => :created, :location => @record }
      else
        format.html { render :action => "new" }
        format.json { render :json => @record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    @record = Record.find(params[:id])

    respond_to do |format|
      if @record.update_attributes(params[:record])
        format.html { redirect_to @record, :notice => 'Record was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    respond_to do |format|
      format.html { redirect_to records_url }
      format.json { head :ok }
    end
  end
end
