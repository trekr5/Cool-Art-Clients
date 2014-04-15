require 'spec_helper'

describe CoolArtClient do
  def app
    CoolArtClient
  end

  include ::Rack::Test::Methods  


it "shows all the galleries" do

  get '/galleries'

   last_response.status.should eq 200


 end

end



