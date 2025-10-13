class Poll < ApplicationRecord
  has_many :options, dependent: :destroy
  has_many :votes, dependent: :destroy
  
  validates :title, presence: true, length: { minimum: 3, maximum: 200 }
  validates :share_code, uniqueness: true, allow_nil: true
  
  accepts_nested_attributes_for :options, allow_destroy: true, reject_if: :all_blank
  
  before_create :generate_share_code
  
  scope :active, -> { where('closes_at IS NULL OR closes_at > ?', Time.current) }
  scope :closed, -> { where('closes_at IS NOT NULL AND closes_at <= ?', Time.current) }
  
  def closed?
    closes_at.present? && closes_at <= Time.current
  end
  
  def total_votes
    votes.count
  end
  
  def voted_by_ip?(ip)
    votes.exists?(voter_ip: ip)
  end
  
  private
  
  def generate_share_code
    self.share_code = SecureRandom.urlsafe_base64(8)
  end
end
