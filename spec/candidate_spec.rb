require './lib/candidate'

let(:candidate){Candidate.new({name: 'Diana D', party: :democrat})}

describe Candidate do

  let(:candidate){Candidate.new({name: 'Diana D', party: :democrat})}

  describe '#initialize' do
    it 'exists' do
      expect(candidate).to be_a Candidate
    end

    it 'has readable attributes' do
      expect(candidate.name).to eq 'Diana D'
      expect(candidate.party).to eq :democrat
      expect(candidate.votes).to eq 0
    end
  end

  describe '#vote_for!' do
    it 'increments the votes attribute' do
      expect(candidate.votes).to eq 0
      candidate.vote_for!
      expect(candidate.votes).to eq 1
    end
  end
end