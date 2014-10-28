require 'spec_helper'
require 'rails_helper'

RSpec.describe Movie, :type => :model do

   describe 'search Tmdb for the entered movie' do
    it 'should make a call to the themoviedb Tmdb database with the movie search string' do
      expect(Tmdb::Movie).to receive(:find).with('1408')
      Movie.find_in_tmdb('1408')
    end

   end
  
   describe 'Insert movie searched in Tmdb to the  Rottenpotato database' do
    it 'should insert the movie details to the rotten potatoes database' do
      array=["263183","215782"]
      Movie.create_from_tmdb(array)
      movie=Movie.find_by_title('Disrupted')
      expect(movie).not_to eq(nil)
    end
   end
end
