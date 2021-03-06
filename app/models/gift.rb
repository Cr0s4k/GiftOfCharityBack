class NullReceiver
  def name
    ''
  end
  def address
    ''
  end
  def country
    ''
  end
  def province
    ''
  end
  def postcode
    ''
  end
  def city
    ''
  end
end

class Gift < ApplicationRecord
  cattr_accessor :skip_emails

  belongs_to :receiver, dependent: :destroy, optional: true
  has_one :donation
  accepts_nested_attributes_for :receiver

  validates :token, presence: true, on: before_create
  validates :secret_url, presence: true, on: before_create
  validates :video_url, presence: true

  before_create do
    # We create a short random unique token
    # https://web.archive.org/web/20121026000606/http://blog.logeek.fr/2009/7/2/creating-small-unique-tokens-in-ruby
    self.token = rand(36**8).to_s(36)

    url = "#{ENV['FRONTEND_URL']}/gifts/#{self.token}"
    if Rails.env.production?
      bitly = Bitly.new(ENV['BITLY_USER'], ENV['BITLY_KEY'])
      url = bitly.shorten(url)
      self.secret_url = url.short_url
    else
      self.secret_url = url
    end
  end

  def display_name
    self.id
  end

  def get_receiver
    self.receiver || NullReceiver.new
  end

  def open_and_notify
    if self.sent? and !self.seen
      self.update(seen: true, opened_at: Time.now)
      GiftMailer.seen_gift_email(self).deliver_later unless Gift.skip_emails
    end
  end
end
