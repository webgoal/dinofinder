class DinosaursController < ApplicationController
  # GET /dinosaurs
  # GET /dinosaurs.xml
  def index
    @dinosaurs = Dinosaur.search(params)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dinosaurs }
    end
  end

  def search
    
  end

  # GET /dinosaurs/1
  # GET /dinosaurs/1.xml
  def show
    @dinosaur = Dinosaur.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dinosaur }
    end
  end

  # GET /dinosaurs/new
  # GET /dinosaurs/new.xml
  def new
    @dinosaur = Dinosaur.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dinosaur }
    end
  end

  # GET /dinosaurs/1/edit
  def edit
    @dinosaur = Dinosaur.find(params[:id])
  end

  # POST /dinosaurs
  # POST /dinosaurs.xml
  def create
    @dinosaur = Dinosaur.new(params[:dinosaur])

    respond_to do |format|
      if @dinosaur.save
        format.html { redirect_to(@dinosaur, :notice => 'Dinosaur was successfully created.') }
        format.xml  { render :xml => @dinosaur, :status => :created, :location => @dinosaur }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dinosaur.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dinosaurs/1
  # PUT /dinosaurs/1.xml
  def update
    @dinosaur = Dinosaur.find(params[:id])

    respond_to do |format|
      if @dinosaur.update_attributes(params[:dinosaur])
        format.html { redirect_to(@dinosaur, :notice => 'Dinosaur was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dinosaur.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dinosaurs/1
  # DELETE /dinosaurs/1.xml
  def destroy
    @dinosaur = Dinosaur.find(params[:id])
    @dinosaur.destroy

    respond_to do |format|
      format.html { redirect_to(dinosaurs_url) }
      format.xml  { head :ok }
    end
  end
end
