# frozen_string_literal: true

require 'entry'

describe Entry do
  describe '#self.all' do
    it 'should ' do
    end
  end

  describe '#self.add' do
    it 'should add one entry at a time' do
      expect(described_class).to respond_to(:add).with(2).arguments
    end

    it 'should save the entry' do
      Entry.add('Test Title', 'Test Entry')
      expect(Entry.all.last.title).to eq 'Test Title'
    end
  end

  describe '#self.edit' do
    it 'should allow the user to edit an entry' do
      expect(described_class).to respond_to(:edit).with(1).argument
    end

    it 'should overwrite the entry' do
      Entry.edit(1)
      expect(Entry.all.last.title).to eq 'Updated Title'
    end
  end
end
