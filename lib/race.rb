class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(data)
    candidate = Candidate.new(data)
    @candidates << candidate
    candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def total_votes
    total_votes = {}
    @candidates.each do |candidate|
      total_votes[candidate.name] = candidate.votes
    end
    total_votes
  end

  def winner
    return false if @open
    total_votes.max_by{|name, votes| votes}[0]
  end

  def tie?
    total_votes.values != total_votes.values.uniq
  end
end
