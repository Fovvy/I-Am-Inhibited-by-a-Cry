class Option < ApplicationRecord
  belongs_to :poll
  has_many :votes, dependent: :destroy
  
  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  
  after_initialize :set_default_vote_count, if: :new_record?
  
  def percentage
    return 0 if poll.total_votes.zero?
    ((vote_count.to_f / poll.total_votes) * 100).round(1)
  end
  
  private
  
  def set_default_vote_count
    self.vote_count ||= 0
  end
end
