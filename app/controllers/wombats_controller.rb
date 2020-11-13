require_relative '../wombats_api'

class WombatsController < ApplicationController
    
  def index
    populate_database if database_update_needed?

    # Store all true wombats from the database in local memory and select
    # one at random
    @trueWombats = Wombat.where(:truewombat == true)
    id = rand(@trueWombats.length - 1) 
       
    @currentWombat = @trueWombats[id]
  end

  # Record that this url is not a wombat and redirect to index
  def destroy
    Wombat.find(params[:id]).update_attribute(:truewombat, false)

    redirect_to wombats_index_url
  end

  private

  # Return true if the database is empty or if the number of true wombats is less than 50
  def database_update_needed?
    !Wombat.exists? || Wombat.where(:truewombat == true).count < 50
  end

  def populate_database
    wombat_urls = WombatsAPI.searchWombats
    
    wombat_urls.each do |url|
      @wombat = Wombat.new(:url => url)
      begin
        @wombat.save
      rescue
        next
      end
    end
  end

end