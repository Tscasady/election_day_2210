require './lib/race'
require './lib/candidate'

describe Race do
  let(race){Race.new('Texas Governor')}
    
  describe '#initialize' do
    it 'exists' do
      expect(race).to be_a Race
    end

    it 'has readable attributes' do
      expect(race.office).to eq "Texas Governor"
      expect(race.candidates).to eq []
    end
  end

  describe '#register_candidate!' do
    it 'creates a new candidate and adds it to the Race candidates array' do
      expect(race.candidates).to eq []
      candidate1 = race.register_candidate!({name: 'Diana D', party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      expect(race.candidates).to eq [candidate1, candidate2]
    end
  end
end