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

end