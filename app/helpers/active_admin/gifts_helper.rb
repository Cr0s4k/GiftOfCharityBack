require 'render_anywhere'

module ActiveAdmin::GiftsHelper
  def generate_pdf(gift)
    kit = PDFKit.new(as_html(gift), page_size: 'A4')
    kit.to_file("#{Rails.root}/public/gift.pdf")
  end

  private
  def as_html(gift)
    render template: "gift_pdf/index", layout: "gift_pdf"
  end
end