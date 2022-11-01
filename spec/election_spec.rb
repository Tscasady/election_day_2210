require './lib/election'
require './lib/race'
require './lib/candidate'


describe Election do
  let(:election) { Election.new('2022') }

  let(:race1) { Race.new("Virginia District 4 Representative") }
  let(:race2) { Race.new("Texas Governor") }

  describe '#intialize' do
    it 'exists' do
      expect(election).to be_a Election
    end

    it 'has readable attributes' do
      expect(election.year).to eq '2022'
      expect(election.races).to eq []
      expect(election.candidates).to eq []
    end
  end

  describe '#add_race' do
    it 'can add a race to its races array' do
      election.add_race(race1)
      election.add_race(race2)
      expect(election.races).to eq [race1, race2]
    end
  end

  describe '#vote_counts' do
    it 'returns a hash with each candidate vote count' do
      election.add_race(race1)
      election.add_race(race2)
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = race2.register_candidate!({name: 'Rita R', party: :republican})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})

      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}
      10.times {candidate3.vote_for!}
      6.times {candidate4.vote_for!}
      6.times {candidate5.vote_for!}

      expect(election.vote_counts).to be == {'Diana D' => 4, 'Diego D' => 10, 'Ida I' => 6, 'Rita R' => 6, 'Roberto R' => 1}
    end
  end
end