require 'spec_helper'

describe Album do
  describe 'validation' do #each describe helps you to partition your test in different areas you want to test

    subject(:album) {build(:album)}

    it 'requires a name' do
      expect(subject).to be_valid
      subject.name = nil
      expect(subject).to be_invalid
      # subject.should be_invalid   ---   this could be used instead of the previous line, all about preference
    end

    it 'requires an img_url' do
      expect(subject).to be_valid
      subject.img_url = nil
      expect(subject).to be_invalid
    end
  end

  describe 'associations' do

    it 'knows owning user' do
      # subject.users.should_not raise_error --- THIS DOES NOT WORK -- it was trying to call users, but users in this case is an active record and doesnt have an id
      # subject.users.should eq []  ---- THIS PASSES  
      expect(subject).to respond_to(:users)
    end

    it 'has songs' do
      expect(subject).to respond_to(:songs)
    end

    it 'has albums' do
      expect(subject).to respond_to(:albums)
    end

  end
end
