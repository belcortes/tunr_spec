require 'spec_helper'

describe User do

  subject(:user) {User.create(name: 'Bel', email: 'belcortes@gmail.com')}

  describe '#purchase' do #when desccribing a method, in this case purchase, we use the pound (#) sign in front of it
    context 'for new album' do
      it 'adds album to collection' do
        album = create(:album)
        lambda {
          subject.purchase(album)
        }.should change{user.albums.size}.by 1
        user.albums.should eq [album]

      end
    end
    context 'for existing album' do
      it 'does not add the same album to array' do
        album = create(:album)
        subject.purchase(album)
        lambda {
          subject.purchase(album)
        }.should change{user.albums.size}.by 0
        user.albums.should eq [album]
      end
    end
  end
  describe '#forget_albums' do
    it 'removes all albums from collection' do
      album = create(:album)
      subject.purchase(album)
      user.albums.should eq [album]
      subject.forget_albums
      subject.albums.size.should eq 0
    end
  end
end
