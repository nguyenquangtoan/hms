class RatePlansController < ApplicationController
  
  
  
  # GET /rates
  # GET /rates.xml
  def index
    @rate_plans = RatePlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rates }
    end
  end

  # GET /rates/1
  # GET /rates/1.xml
  def show
    @rate_plan = RatePlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rate }
    end
  end

  # GET /rates/new
  # GET /rates/new.xml
  def new
    @rate_plan = RatePlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rate }
    end
  end

  # GET /rates/1/edit
  def edit
    @rate_plan = RatePlan.find(params[:id])
  end

  # POST /rates
  # POST /rates.xml
  def create
    @rate_plan = RatePlan.new(params[:rate_plan])

    respond_to do |format|
      if @rate_plan.save
        format.html { redirect_to(@rate_plan, :notice => 'Rate was successfully created.') }
        format.xml  { render :xml => @rate_plan, :status => :created, :location => @rate_plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rate_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rates/1
  # PUT /rates/1.xml
  def update
    @rate_plan = RatePlan.find(params[:id])

    respond_to do |format|
      if @rate_plan.update_attributes(params[:rate_plan])
        format.html { redirect_to(@rate_plan, :notice => 'Rate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rate_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rates/1
  # DELETE /rates/1.xml
  def destroy
    @rate_plan = RatePlan.find(params[:id])
    @rate_plan.destroy

    respond_to do |format|
      format.html { redirect_to(rate_plans_url) }
      format.xml  { head :ok }
    end
  end
end
