require 'rails_helper'

#rspec演習

RSpec.describe '四則演算' do
  it '1 + 1 は 2 になること' do
    expect(1 + 1).to eq 2
  end
end

RSpec.describe User do
    let(:user) { User.new(name: 'たろう', age: age) }
    shared_context '12歳の場合' do
      let(:age) { 12 }
    end
    shared_context '13歳の場合' do
      let(:age) { 13 }
    end

    describe 'greet' do
      subject { user.greet }
      context '12歳以下の場合' do
        include_context '12歳の場合'
        it { is_expected.to eq 'ぼくはたろうだよ。' }
      end
      context '13歳以上の場合' do
        include_context '13歳の場合'
        it { is_expected.to eq '僕はたろうです。' }
      end
    end
  
    describe '#child?' do
      subject { user.child? }
      context '12歳以下の場合' do
        include_context '12歳の場合'
        it { is_expected.to eq true }
      end
      context '13歳以上の場合' do
        include_context '13歳の場合'
        it { is_expected.to eq false }
      end
    end
  end

  #sample_code

  it 'エラーなく予報をツイートすること' do
    twitter_client_mock = double('Twitter client')
    allow(twitter_client_mock).to receive(:update)
  
    weather_bot = Weatherbot.new
    allow(weather_bot).to receive(:twitter_client).and_return(twitter_client_mock)
  
    expect{ weather_bot.tweet_forecast }.not_to raise_error
  end


   
