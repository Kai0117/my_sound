class MusicRecommender
  def self.call(emotion_text)
    prompt = <<~PROMPT
      ユーザーの気持ちに寄り添い、次の文章から最適な音楽を1曲だけ提案してください。
      投稿内容: #{emotion_text}
      返答形式: 「曲名 - アーティスト名」
    PROMPT

    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])

    begin
      response = client.chat(
        parameters: {
          model: "gpt-4",
          messages: [{ role: "user", content: prompt }],
          temperature: 0.7
        }
      )
    rescue StandardError => e
      Rails.logger.error("OpenAI Error: #{e.message}")
      return nil
    end

    music_suggestion = response.dig("choices", 0, "message", "content")&.strip
    return nil if music_suggestion.blank?

    # 「曲名 - アーティスト名」の形式で返す
    music_suggestion.split(" - ").map(&:strip)
  end
end

  

  