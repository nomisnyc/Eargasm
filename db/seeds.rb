Music.delete_all
User.delete_all


m1 = Music.create(:name =>'Jay-Z', :song_name => 'dead presidents', :rating => 5, :genre => 'rap' , :url => 'http://www.youtube.com/embed/6BCsxQg3NE4', :location => 'nyc', :description => ' Jay-Z and Beyounce kickin it with Obama')

m2= Music.create(:name =>'Kendrick Lamar', :song_name => 'money trees', :rating => 6, :genre => 'rap', :url => 'http://www.youtube.com/embed/iMR45VOKj58', :location => 'nyc', :description => 'This is some hardcore shit about life in the porjects of Compton')

#m3= Music.create(:name =>'Divine Fits', :song_name => 'would that not be nice', :rating => 7, :genre => 'indie', :url => 'https://www.youtube.com/embed/8NqbhygoDSA', :location => 'nyc')

u1= User.create(:name => 'Adi', :email => 'adityasingh89@gmail.com', :password => 'a', :password_confirmation => 'a', :location => 'NYC')

u1.musics << [m1, m2]


