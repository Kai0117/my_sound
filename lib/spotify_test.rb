# lib/spotify_test.rb
require 'net/http'
require 'uri'
require 'json'
require 'base64'

client_id = ENV['SPOTIFY_CLIENT_ID']
client_secret = ENV['SPOTIFY_CLIENT_SECRET']

auth = Base64.strict_encode64("#{client_id}:#{client_secret}")

uri = URI("https://accounts.spotify.com/api/token")
req = Net::HTTP::Post.new(uri)
req['Authorization'] = "Basic #{auth}"
req.set_form_data({ 'grant_type' => 'client_credentials' })

res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
token = JSON.parse(res.body)["access_token"]

puts "Access Token: #{token}"

search_query = URI.encode_www_form_component("Imagine Dragons Believer")
uri = URI("https://api.spotify.com/v1/search?q=#{search_query}&type=track&limit=1")

req = Net::HTTP::Get.new(uri)
req['Authorization'] = "Bearer #{token}"

res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
track = JSON.parse(res.body).dig("tracks", "items", 0)

if track
  puts "曲名: #{track['name']}"
  puts "アーティスト: #{track['artists'][0]['name']}"
  puts "Spotifyリンク: #{track['external_urls']['spotify']}"
else
  puts "曲が見つかりませんでした"
end
