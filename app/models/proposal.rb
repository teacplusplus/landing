class Proposal < ActiveRecord::Base
  validates_presence_of :name, :email, :phone, :message
  after_create :send_email
  private
  def send_email
    BaseMailer.inform(self).deliver
  end
end
