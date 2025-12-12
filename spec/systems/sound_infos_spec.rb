# spec/system/sound_infos_spec.rb
require 'rails_helper'

RSpec.describe "SoundInfos", type: :system do
  before do
    # chromedriver を使わない軽いドライバにする（JS不要ならOK）
    driven_by :rack_test
  end

  it "shows the correct title when visiting the new page" do
    visit new_sound_info_path
    expect(page).to have_title(/MindSound/)
  end
end
