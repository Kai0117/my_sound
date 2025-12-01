require 'rails_helper'

#rspec演習

RSpec.describe '四則演算' do
  it '1 + 1 は 2 になること' do
    expect(1 + 1).to eq 2
  end
end

RSpec.describe User do
  describe "#greet" do
    let(:user) { User.new(name: 'たろう', age: age) }
    subject { user.greet}
    context '12歳以下の場合' do
      let(:age) { 12 }
      it {is_expected.to eq 'ぼくはたろうだよ。'}
    end
    context '13歳以上の場合' do
      let(:age) { 13 }
      it {is_expected.to eq '僕はたろうです。'}
    end
  end
end
