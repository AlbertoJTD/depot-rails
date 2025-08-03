require 'rails_helper'

RSpec.describe "Store", type: :system do
  # before do
  #   Product.create!(
  #     title: 'Programming Ruby 1.9',
  #     description: 'Learn Ruby',
  #     image_url: 'ruby.jpg',
  #     price: 49.95
  #   )
  # end

  it 'shows the store index with products and navigation' do
    pending "It is not working, due to a Webdrivers::VersionError"
    # visit store_index_path

    # expect(page).to have_css('nav.side_nav a', minimum: 4)
    # expect(page).to have_css('main ul.catalog li', count: 3)
    # expect(page).to have_selector('h2', text: 'Programming Ruby 1.9')
    # expect(page).to have_css('.price', text: /\$[,\d]+\.\d\d/)
  end
end
