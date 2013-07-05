require 'spec_helper'

describe Genre do
  describe 'validation' do
    subject(:genre) {create(:genre)}

    it 'requires a name' do
      expect(subject).to be_valid
      subject.name = nil
      expect(subject).to be_invalid
    end
  end
  describe 'associations' do
    it 'has songs' do
      expect(subject).to respond_to(:songs)
    end

  end
end
