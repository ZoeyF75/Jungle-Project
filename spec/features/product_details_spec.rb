require 'rails_helper'

RSpec.feature "Navigate from home page to product details page", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


  scenario "Visit product_details page" do
    # ACT
    visit root_path

    first('a.btn.btn-default').click
    # DEBUG / VERIFY
    save_screenshot "product_details.png"
    expect(page).to have_content 'Apparel'
  end

end