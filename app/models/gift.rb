class Gift < ApplicationRecord
  belongs_to :receiver
  belongs_to :video

  before_create do
    # We create a short random unique token
    # https://web.archive.org/web/20121026000606/http://blog.logeek.fr/2009/7/2/creating-small-unique-tokens-in-ruby
    self.token = rand(36**8).to_s(36)

    url = "#{ENV['FRONTEND_URL']}/gift/#{self.token}"
    if Rails.env.production?
      bitly = Bitly.new(ENV['BITLY_USER'], ENV['BITLY_KEY'])
      url = bitly.shorten(url)
      self.secret_url = url.short_url
    else
      self.secret_url = url
    end
  end
end
