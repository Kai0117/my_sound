class SoundInfosController < ApplicationController
  
  require "openai"

  # ユーザーが投稿した感情を受け取り、曲を提案
  def create
    emotion_text = params[:emotion_text]
  
    # ① OpenAIで曲名・アーティストを生成
    suggestion = MusicRecommender.call(emotion_text)
    if suggestion.nil?
      flash.now[:error] = "音楽の提案に失敗しました。"
      return render :new, status: :unprocessable_entity
    end
    title, artist = suggestion
  
    # ② Spotify APIで曲情報を取得
    track_info = SpotifySearcher.search_track(title, artist)
    if track_info.nil?
      flash.now[:error] = "Spotifyで曲情報を取得できませんでした。"
      return render :new, status: :unprocessable_entity
    end
  
    # ③ インスタンス変数に代入
    @title = track_info[:title]
    @artist = track_info[:artist]
    @cover_url = track_info[:cover_url]
    @track_url = track_info[:url]
  
    render :show
  end
end