require 'rails_helper'

#sample

RSpec.describe "SoundInfos", type: :request do
  describe "URLテスト" do
    it "returns http success" do
        get new_sound_info_path
        expect(response).to have_http_status(:ok)
    end
  end
end

RSpec.describe "SoundInfos", type: :request do
  describe "POST /sound_infos" do
    it "renders the show template without calling real APIs" do
        # ここで外部APIの呼び出しを「擬似的に」に実装する
        allow(MusicRecommender).to receive(:call).and_return(
          ["dummy title", "dummy artist"]
        )
  
        allow(SpotifySearcher).to receive(:search_track).and_return(
          {
            title:  "dummy title",
            artist: "dummy artist",
            cover_url: "https://example.com/cover.jpg",
            url: "https://example.com/track"
          }
        )
  
        # 実際に create に POST
        post sound_infos_path, params: {
          emotion_text: "テスト用テキスト",
          selected_mood: "happy",
          selected_genres: ["pop"]
        }
  
        # show が描画されるかだけ見る
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:show)
    end
  end
end
