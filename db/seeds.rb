Music.delete_all


m1 = Music.create(:name =>'Jacks Mannequin ', :song_name => 'Swim', :rating => 5, :genre => ' alternative', :url => ' https://www.youtube.com/embed/sA8PaIw5gcE ', :post_by => ' Simon', :image_url => 'http://images.fanpop.com/images/image_uploads/Jack-s-Mannequin-jack-27s-mannequin-263922_600_330.jpg')

m2= Music.create(:name =>'Coldplay', :song_name => ' Paradise ', :rating => '6 ', :genre => ' alternative ', :url => 'https://www.youtube.com/embed/1G4isv_Fylg ', :post_by => 'Simon ', :image_url => 'http://www.jonathanfun.com/wp-content/uploads/2010/11/coldplay-1.jpg')


m3= Music.create(:name =>'Modest Mouse', :song_name => ' Float On', :rating => '7 ', :genre => 'indie', :url => 'https://www.youtube.com/embed/CTAud5O7Qqk ', :post_by => ' Simon', :image_url => 'http://www.theaureview.com/sites/default/files/Modest-Mouse.jpg')

u1= User.create(:name => 'Adi', :email => 'adityasingh89@gmail.com', :password => 'a', :password_confirmation => 'a')

u1.musics << [m1, m2, m3]