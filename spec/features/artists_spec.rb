require 'spec_helper'


describe 'Artists'  do
  before(:each) do
    create(:artist)
    create(:artist2)
  end

  describe 'navigation from home page' do
    it 'displays link to artist#index page' do
      visit '/'

      find('h1').should have_content('HOME')
      click_link('Artists')
      find('h1').should_not have_content('HOME')
      find('h1').should have_content('Artists')
    end 
  end

  describe 'Artists page' do
    before do
       visit '/artists'
    end
    it 'displays link to artist#new' do
      find('h1').should have_content('Artists')
      click_link('New Artist')
      find('h1').should have_content('New Artist')
    end

    it 'should have an artist table' do
      page.should have_xpath('//table/thead/th')
      page.should have_xpath('//table/tbody/tr/td')
    end

    it 'should display all artists' do
      page.should have_content(@artists)
      click_link(Artist)
      find('h1').should have_content(Artist)
    end
  end

  describe 'Artist Show page' do
    before do
       visit artist_path
    end
    it'displays artist info' do
      pending
    end
  end

  describe 'New Artist page' do
    #write test to see whether an artist can be created using a form on the new artist page
    it 'has form for new artist that can be submitted to create new artist' do
      visit '/artists/new'
      find('h1').should have_content('New Artist')
      page.should have_selector('form#new_artist')
      within('form#new_artist') do
        fill_in 'Name', with: 'beatles'
        fill_in 'Url', with: 'beatles.com'
        find_field('Name').value.should eq 'beatles'
        find_field('Url').value.should eq 'beatles.com'
        click_button("Create Artist")
      end
      expect(page).to have_content 'Artists'
      (Artist.count).should eq 3  
    end
  end


end