class SoundInfosController < ApplicationController
  def new
  end

  require "openai"

  def create
    # 投稿内容（感情テキスト）
    emotion_text = params[:emotion_text]
  
    # OpenAI で音楽を提案するプロンプト
    prompt = <<~PROMPT
      ユーザーの気持ちに寄り添い、次の文章から最適な音楽を1曲だけ提案してください。
      投稿内容: #{emotion_text}
      返答形式: 「曲名 - アーティスト名」
    PROMPT
  
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
  
    begin
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo-16k",
          messages: [{ role: "user", content: prompt }],
          temperature: 0.7
        }
      )
    rescue Faraday::TooManyRequestsError
      sleep 1
      retry
    end
  
    # AIの返答を取得
    music_suggestion = response.dig("choices", 0, "message", "content").strip
    title, artist = music_suggestion.split(" - ").map(&:strip)
  
    # Spotify検索リンクを生成（例）
    search_query = URI.encode_www_form_component("#{title} #{artist}")
    track_url = "https://open.spotify.com/search/#{search_query}"
  
    # SoundInfo に保存
    @sound_info = SoundInfo.new(
      content: emotion_text,
      title: title,
      artist: artist,
      track_url: track_url,
      cover_url: nil
    )
  
    if @sound_info.save
      flash[:success] = "おすすめの音楽を提案しました！"
      redirect_to sound_info_path(@sound_info)
    else
      flash.now[:error] = "音楽の提案に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end
  
  
 

  def show
    @sound_info = SoundInfo.find(params[:id])
  end
end