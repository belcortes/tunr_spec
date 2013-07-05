require 'spec_helper'

describe Artist do
  describe 'validation' do
    subject(:artist) {Artist.new(name: "The Beatles", url: "beatles.com")}

    it 'requires a name' do
        expect(subject).to be_valid
        subject.name = nil
        expect(subject).to be_invalid
        # subject.should be_invalid   ---   this could be used instead of the previous line, all about preference
    end
    it 'requires a url' do
        expect(subject).to be_valid
        subject.url = nil
        expect(subject).to be_invalid
        # subject.should be_invalid   ---   this could be used instead of the previous line, all about preference
    end
  end

  describe 'associations' do
    it 'has songs' do
      expect(subject).to respond_to(:songs)
    end
    it 'has albums' do
      expect(subject).to respond_to(:albums)
    end
  end
end
