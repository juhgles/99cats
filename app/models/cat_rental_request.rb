class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validates :overlapping_approved_requests

  belongs_to :cat, :dependent => :destroy

  def overlapping_request
    taken_requests = {}
    cat_requests = self.cat.cat_rental_requests
    cat_requests.each do |request|
      if start_date.between?(request.start_date,request.end_date)
        taken_requests[request] = true
      elsif end_date.between?(request.start_date,request.end_date)
        taken_requests[request] = true
      end
    taken_requests
  end

  def overlapping_approved_requests
    bad_approved_requests = overlapping_request
    approved_requests = self.bad_approved_requests.where(status: 'APPROVED')
    approved_requests
  end

  def overlapping_pending_requests
    bad_pending_requests = overlapping_request
    pending_requests = self.bad_pending_requests.where(status: 'PENDING')
    pending_requests
  end

  def approve!
    return false if self.deny!
    self.status = 'APPROVED'
    self.save
    bad_pending_requests = overlapping_pending_requests
    bad_pending_requests.each do |bad_request|
      bad_request.status = 'DENIED'
      bad_request.save
    end
    self.status
  end

  def deny!
    overlapping_approved_requests ? true : false
  end

end
