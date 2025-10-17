 class SongsController < ApplicationController
    require 'rspotify'
  
    def search
      RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
      if params[:search_artist].present?
        @searchartists = RSpotify::Artist.search(params[:search_artist])
      end
  
      if params[:search_track].present?
        @searchtracks = RSpotify::Track.search(params[:search_track])
      end
    end
  
    def show
      @track = RSpotify::Track.find(params[:id])
    end
  
    def artist
      @artist = RSpotify::Artist.find(params[:id])
    end
  
    def album
      @album = RSpotify::Album.find(params[:id])
    end
  end

