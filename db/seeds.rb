Music.delete_all
User.delete_all

m1 = Music.create(:name =>'Chris Brown', :song_name => 'Dont Wake Me Up', :rating => 5, :genre => 'R&B', :url => ' hhttp://www.youtube.com/watch?v=QOowQeKyNkQ', :image_url => 'http://i2.cdn.turner.com/cnn/dam/assets/120911071015-chris-brown-mtv-vma-2012-award-story-top.jpg')

m2= Music.create(:name =>'Coldplay', :song_name => ' Paradise ', :rating => '6 ', :genre => ' alternative ', :url => 'https://www.youtube.com/embed/1G4isv_Fylg ', :post_by => 'Simon', :image_url => 'http://www.jonathanfun.com/wp-content/uploads/2010/11/coldplay-1.jpg')

m3= Music.create(:name =>'Modest Mouse', :song_name => ' Float On', :rating => '7 ', :genre => 'indie', :url => 'https://www.youtube.com/embed/CTAud5O7Qqk ', :post_by => ' Simon', :image_url => 'http://www.theaureview.com/sites/default/files/Modest-Mouse.jpg')

u1= User.create(:name => 'Adi', :email => 'adi@gmail.com', :password => 'a', :password_confirmation => 'a')

u1.musics << [m1, m2, m3]