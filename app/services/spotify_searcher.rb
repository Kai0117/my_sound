class SpotifySearcher
  BASE_URL = "https://api.spotify.com/v1"

  require "net/http"
require "uri"
require "json"
require "base64"


  def self.search_track(title, artist)
    token = get_access_token
    return nil if token.nil?

    query = URI.encode_www_form_component("#{title} #{artist}")
    url = URI("#{BASE_URL}/search?q=#{query}&type=track&limit=1")

    response = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
      request = Net::HTTP::Get.new(url)
      request["Authorization"] = "Bearer #{token}"
      http.request(request)
    end

    return nil unless response.is_a?(Net::HTTPSuccess)

    json = JSON.parse(response.body)
    items = json.dig("tracks", "items")
    return nil if items.nil? || items.empty?

    track = items.first

    {
      title: track["name"],
      artist: track["artists"][0]["name"],
      url: track["external_urls"]["spotify"],
      cover_url: track.dig("album", "images", 0, "url")
    }
  rescue StandardError => e
    Rails.logger.error("Spotify API Error: #{e.message}")
    nil
  end

  private

  def self.get_access_token
    client_id = ENV['SPOTIFY_CLIENT_ID']
    client_secret = ENV['SPOTIFY_CLIENT_SECRET']
    auth = Base64.strict_encode64("#{client_id}:#{client_secret}")

    uri = URI("https://accounts.spotify.com/api/token")
    request = Net::HTTP::Post.new(uri)
    request["Authorization"] = "Basic #{auth}"
    request.set_form_data({ grant_type: "client_credentials" })

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    json = JSON.parse(response.body)
    json["access_token"]
  rescue StandardError => e
    Rails.logger.error("Spotify Token Error: #{e.message}")
    nil
  end
end
  