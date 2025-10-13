class Vote < ApplicationRecord
  belongs_to :poll
  belongs_to :option, counter_cache: :vote_count
  
  validates :voter_ip, presence: true
  validate :poll_not_closed
  validate :one_vote_per_ip, unless: -> { poll&.allow_multiple }
  
  private
  
  def poll_not_closed
    errors.add(:base, 'Poll is closed') if poll&.closed?
  end
  
  def one_vote_per_ip
    if poll.votes.where(voter_ip: voter_ip).where.not(id: id).exists?
      errors.add(:base, 'You have already voted in this poll')
    end
  end
end
