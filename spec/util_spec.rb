require_relative 'spec_helper'

describe Util do
  describe '#to_ordinal' do
    it 'converts characters to numbers' do
      expect(Util.to_ordinal('c')).to equal(3)
    end

    it 'is not zero-based' do
      expect(Util.to_ordinal('a')).to equal(1)
    end

    it 'does not care about case' do
      expect(Util.to_ordinal('A')).to equal(1)
    end

  end

  describe '#to_ascii' do
    it 'converts numbers to lower-case characters' do
      expect(Util.to_ascii(3)).to eq('c')
    end

  end

end