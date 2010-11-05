class MembershipsController < ApplicationController
  filter_access_to :all

  def edit
    @membership = Membership.find(params[:id])
  end
  
  def update
    @membership = Membership.find(params[:id])

    respond_to do |format|
      instrument = Instrument.find params[:membership][:instrument_id]
      
      if instrument
        @membership.instrument = instrument
      end
        
      if @membership.save
        format.html { redirect_to(@membership.project, :notice => 'Mitgliedschaft erfolgreich angepasst.') }
      else
        format.html { render :action => "edit" }
      end
      
    end
  end
  
end
