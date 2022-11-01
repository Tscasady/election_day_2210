require './lib/race'
require './lib/candidate'

describe Race do
      
  describe '#initialize' do
    it 'exists' do
      race = Race.new('Texas Governor')
      expect(race).to be_a Race
    end

    it 'has readable attributes' do
      race = Race.new('Texas Governor')
      expect(race.office).to eq "Texas Governor"
      expect(race.candidates).to eq []
    end
  end

  describe '#register_candidate!' do
    it 'creates a new candidate and adds it to the Race candidates array' do
      race = Race.new('Texas Governor')
      expect(race.candidates).to eq []
      candidate1 = race.register_candidate!({name: 'Diana D', party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      expect(race.candidates).to eq [candidate1, candidate2]
    end
  end

  describe '#open?' do
    it 'returns a boolean indicating whether the race is open or not' do
      race = Race.new('Texas Governor')
      expect(race.open?).to be true
      race.close!
      expect(race.open?).to be false
    end
  end

  describe 'close!' do
    it 'closes the race' do
      race = Race.new('Texas Governor')
      expect(race.open?).to be true
      race.close!
      expect(race.open?).to be false
    end
  end

  describe 'winner' do
    it 'returns false if the race is open, otherwise returns candidate with the most votes' do
      race = Race.new('Texas Governor')
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}
      expect(race.winner).to eq false
      race.close!
      expect(race.winner).to eq 'Diana D'
    end

    it 'can return any of the highest voted candidates in case of a tie' do
      race = Race.new('Texas Governor')
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      4.times {candidate1.vote_for!}
      4.times {candidate2.vote_for!}
      race.close!
      expect(race.winner).to eq 'Diana D'
    end
  end

  describe 'tie?' do
    it 'returns a boolean indicating whether or not two or more candidates received the highest number of votes' do
      race = Race.new('Texas Governor')
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}
      
      expect(race.tie?).to eq false
      
      3.times {candidate2.vote_for!}
      expect(race.tie?).to eq true
    end
  end

  describe '#winner_as_candidate' do
    it 'returns a candidate object associated with a winner name' do
      race = Race.new('Texas Governor')
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      4.times {candidate1.vote_for!}
      4.times {candidate2.vote_for!}
      race.close!
      expect(race.winner_as_candidate).to eq candidate1
    end
  end
end