class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 R)
  end
  
  

 def Movie::find_in_tmdb (moviename=String.new)
    moviesrecord=Array.new
    finalrecord=Array.new
    if moviename==nil or moviename==""
	 return 0
    else
	 Tmdb::Api.key("f4702b08c0ac6ea5b51425788bb26562")

	 moviesrecord=Tmdb::Movie.find(moviename)

	 if moviesrecord==nil or moviesrecord==[]
           return 1
         else
            moviesrecord.each do |movie|
	       finalrecord << {:title => movie.title, :rating => 'R', :release_date => movie.release_date, :id => movie.id}
            end
            
	    
           return finalrecord
         end
         
    end 

 end

 def Movie::create_from_tmdb (movieidarray=Array.new)
   retval=Hash.new
   movies=Array.new
   
    movieidarray.each do |id|
     retval=Tmdb::Movie.detail(id)  
     #movies << {:title => retval.title, :rating => 'R', :description => nil, :release_date => retval.release_date}
     Movie.create!({:title => retval.title, :rating => 'R', :description => nil, :release_date => retval.release_date})
    end
    
  
   
   


 end
end
