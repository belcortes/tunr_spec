require 'spec_helper'

describe Song do
  describe 'validations' do

    subject(:song) {create(:song)}

    it 'requires a name' do
      expect(subject).to be_valid
      subject.name = nil
      expect(subject).to be_invalid
    end
  end

  describe 'associations' do
    it 'has an artist' do
      expect(subject).to respond_to(:artist)
    end

    it 'has an album' do
      expect(subject).to respond_to(:album)
    end

    it 'has genres' do
      expect(subject).to respond_to(:genres)
    end
  end
end
