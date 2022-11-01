class Election
  attr_reader :year, :races, :candidates

  def initialize(year)
    @year = year
    @candidates = []
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def vote_counts
    vote_counts_total = {}
    @races.each do |race|
      race.candidates.each do |candidate|
        vote_counts_total[candidate.name] = candidate.votes
      end
    end
    vote_counts_total
  end

  def winners
    @races.map do |race|
      next if race.open?
      next if race.tie?
      race.winner_as_candidate
    end.compact
  end
end
