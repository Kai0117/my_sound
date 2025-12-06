require 'rails_helper'

RSpec.describe "SoundInfos", type: :request do
  describe "URLテスト" do
    it "returns http success" do
        get new_sound_info_path
        expect(response).to have_http_status(:ok)
    end
  end
end