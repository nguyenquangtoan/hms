class HotelController < ApplicationController
  def dashboard
  end
  
  def check_available
    occus = Occupancy.all
    used_ids = []
    occus.each do |occu|
      if occu.check_out.nil? and occu.move.nil?  
        used_ids << occu.room_id
      end
    end
    if used_ids.empty?
      @rooms = Room.all
    else
      @rooms = Room.all(:conditions => ["id not in (?)", used_ids])
    end
    
    render :checkin
  end
  
  def check_occupancies
    occus = Occupancy.all
    used_ids = []
    occus.each do |occu|
      if occu.check_out.nil? and occu.move.nil? 
        used_ids << occu.room_id
      end
    end
   
    @rooms = Room.where(:id => used_ids)
    #debugger    
    render :checkout
  end

  def addguests
    @room_id = params[:id]
  end
  
  def checkin
  	  #debugger
    room_id = params[:id]
    no_loop = params[:no_of_row]  
    no_loop.times do |t|
      id_number = params["id_number#{t}"]
      if !id_number.empty?  
        guest = Guest.where(:personal_id_number => id_number).first
        if guest.nil?
          guest = Guest.create!(:name => params["name#{t}"],:personal_id_number => id_number)
          end
        #debugger
        Occupancy.create!(:guest_id => guest.id, :room_id => room_id, :check_in => Time.now)
      end
    end 
    redirect_to :action => :check_available
  end

  def details
    @room = Room.find(params[:id])
  end
  
  def move    
    if params[:new_room_id].nil?
      occus = Occupancy.all
      used_ids = []
      occus.each do |occu|
        if occu.check_out.nil? and occu.move.nil?
          used_ids << occu.room_id
        end
      end
      if used_ids.empty?
        @rooms = Room.all
      else
        @rooms = Room.all(:conditions => ["id not in (?)", used_ids])
      end
      
      session[:move_occu_id] = params[:occu_id] if !params[:occu_id].nil?
      session[:move_room_id] = params[:room_id] if !params[:room_id].nil?
      
      render :action => :move    
    else
      if !session[:move_occu_id].nil? # move individual
        occu = Occupancy.find(session[:move_occu_id])
        occu.move= Time.now
        occu.save!
        Occupancy.create!(:guest_id => occu.guest_id, :room_id => params[:new_room_id], :check_in => Time.now)
        
        session[:move_occu_id] = nil
        
        @room = Room.find(occu.room_id)
        
        render :details
        
      elsif !session[:move_room_id].nil? # move group 
        occus = Room.find(session[:move_room_id]).current_occupancies
        occus.each do |occu|
          occu.move= Time.now
          occu.save!
          Occupancy.create!(:guest_id => occu.guest_id, :room_id => params[:new_room_id], :check_in => Time.now)
        end
        
        session[:move_room_id] = nil
        
        redirect_to occupancies_path
      end
    end  
  end

  def payer
    session[:room_id] = params[:id]
    room = Room.find(params[:id])
    @occupants = room.current_occupants
  end
  
  def checkout
    #if params[:select_occupant]
      #payer = Guest.find(params[:payer_id])
    #elsif Guest.exists?(:personal_id_number => params[:payer_id])
      
   # end
  end
  
  

end
