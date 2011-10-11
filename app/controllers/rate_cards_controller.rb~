class RateCardsController < ApplicationController
  # GET /rate_cards
  # GET /rate_cards.xml
  def index
    @rate_cards = RateCard.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rate_cards }
    end
  end

  # GET /rate_cards/1
  # GET /rate_cards/1.xml
  def show
    @rate_card = RateCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rate_card }
    end
  end

  # GET /rate_cards/new
  # GET /rate_cards/new.xml
  def new
    @rate_card = RateCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rate_card }
    end
  end

  # GET /rate_cards/1/edit
  def edit
    @rate_card = RateCard.find(params[:id])
  end

  # POST /rate_cards
  # POST /rate_cards.xml
  def create
    @rate_card = RateCard.new(params[:rate_card])

    respond_to do |format|
      if @rate_card.save
        format.html { redirect_to(@rate_card, :notice => 'Rate card was successfully created.') }
        format.xml  { render :xml => @rate_card, :status => :created, :location => @rate_card }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rate_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rate_cards/1
  # PUT /rate_cards/1.xml
  def update
    @rate_card = RateCard.find(params[:id])

    respond_to do |format|
      if @rate_card.update_attributes(params[:rate_card])
        format.html { redirect_to(@rate_card, :notice => 'Rate card was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rate_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rate_cards/1
  # DELETE /rate_cards/1.xml
  def destroy
    @rate_card = RateCard.find(params[:id])
    @rate_card.destroy

    respond_to do |format|
      format.html { redirect_to(rate_cards_url) }
      format.xml  { head :ok }
    end
  end
end
