require 'rails_helper'

RSpec.describe ConcertsController, type: :controller do
  describe "GET #index" do

    context "when receiving no city param" do
      before(:each) do
        get :index
      end
    
      it "responds with an HTTP 404 status code" do
        expect(response).to have_http_status(404)
      end 

      it "renders the concert index template" do
        expect(response).to render_template('site/index')
      end

      it "contains a flash message" do
        expect(flash[:error]).to be_present
      end
    end

    context "when receiving city param as an empty string" do
      before(:each) do
        get(:index, {'city' => ''})
      end
    
      it "responds with an HTTP 404 status code" do
        expect(response).to have_http_status(404)
      end 

      it "renders the concert index template" do
        expect(response).to render_template('site/index')
      end

      it "contains a flash message" do
        expect(flash[:error]).to be_present
      end
    end

    context "when receiving city param with a city without concerts" do
      before(:each) do
        get(:index, {'city' => 'dos hermanas'})
      end
    
      it "responds with an HTTP 404 status code" do
        expect(response).to have_http_status(404)
      end 

      it "renders the concert index template" do
        expect(response).to render_template('site/index')
      end

      it "contains a flash message" do
        expect(flash[:error]).to be_present
      end
    end

    context "when receiving city param with a city with a concert" do
      before(:each) do
        @concert = create(:concert, city: 'Sevilla')
        get(:index, {'city' => 'Sevilla'})
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the index template" do
        expect(response).to render_template("index")
      end

      it "gets an array of concerts with the correct concert" do
        expect(assigns(:concerts)).to match_array([@concert])
      end
    end


  end
end
