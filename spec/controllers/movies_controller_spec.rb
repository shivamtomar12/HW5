require_relative '../spec_helper'
require_relative '../rails_helper'
RSpec.describe MoviesController, :type => :controller do
 let(:movies_controller) {MoviesController.new}
 describe '#search_tmdb' do
   before :each do
      @fake = [double('1408'), double('Gridiron Gang')]
    end
   it 'should call the method of model to search for the movie in Tmdb database' do
     Movie.should_receive(:find_in_tmdb).with('1408').and_return(@fake)
     post :search_tmdb, {:movie => {:search => '1408'}}
   end

   it 'should select the result retrieved after searching' do
     Movie=double(Movie)
     Movie.stub(:find_in_tmdb).and_return(@fake)
     #allow(Movie).to receive(Movie::find_in_tmdb).and_return(@fake)
     post :search_tmdb, {:movie => {:search => '1408'}}
     expect(response).to render_template(:search_tmdb)
     
   end
   
    
     it 'should make the TMDb search results available to that template' do
        Movie1=double(Movie)
        
    	Movie1.stub(:find_in_tmdb).and_return(@fake)
    	post :search_tmdb,{:movie => {:search => 'Troy'}}
    	assigns(:movies).should ==@fake
    end
 end
end
