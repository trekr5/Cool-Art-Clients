require 'sinatra/base'
require 'pickled_shark'

class CoolArtClient < Sinatra::Base

  get "/" do 
    erb :index
  end

  get "/galleries" do
     @galleries = PickledShark::Gallery.all["galleries"]
     erb :galleries
  end

  get "/galleries/:id" do
     @gallery = PickledShark::Gallery.get_gallery(params[:id])
     erb :gallery
  end

  get "/galleries/:id/exhibitions" do
    @exhibition = PickledShark::Exhibition.get_exhibitions_for_gallery(params[:id])
    erb :exhibition
  end

  get "/exhibitions/:exhibition_id/tickets" do

  #@ticket = PickledShark::Ticket.create(params[:name], params[:exhibition_id], params[:entry_at]) 
    erb :create_ticket
  end

  post "/exhibitions/:exhibition_id/tickets" do

    @ticket = PickledShark::Ticket.create(params[:name], params[:exhibition_id], params[:entry_at]) 
    erb :bought_ticket
  end
end