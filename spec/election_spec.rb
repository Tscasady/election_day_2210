require './lib/eleciton'

describe Election do
  let(:eleciton) { Election.new('2022') }

  let(:race1) { Race.new("Virginia District 4 Representative") }
  let(:race2) { Race.new("Texas Governor") }

  describe '#intialize' do
    it 'exists' do
      expect(eleciton).to be_a Election
    end

    it 'has readable attributes' do
      expect(eleciton.year).to eq '2022'
      expect(election.races).to eq []
      expect(election.candidates).to eq []
    end
  end

  describe '#add_race' do
    it 'can add a race to its races array' do
      eleciton.add_race(race1)
      eleciton.add_race(race2)
      expect(eleciton.races).to eq [race1, race2]
    end
  end

  describe '#vote_counts' do
    it 'returns a hash with each candidate vote count' do
      eleciton.add_race(race1)
      eleciton.add_race(race2)
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

      expect(eleciton.vote_counts).to eq { "Diana D" => 4, "Roberto R"=>1, "Diego D"=>10, "Rita R"=>6, "Ida I"=>6}
    end
  end
end