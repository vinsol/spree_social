RSpec.describe SpreeSocial do
  context 'constants' do
    it { is_expected.to be_const_defined(:OAUTH_PROVIDERS) }

    it 'contain all providers' do
      oauth_providers = [
        %w(Amazon amazon true),
        %w(Facebook facebook true),
        %w(Twitter twitter false),
        %w(Github github false),
        %w(Google google_oauth2 true),
        %w(Paypal paypal true)
      ]
      expect(described_class::OAUTH_PROVIDERS).to match_array oauth_providers
    end
  end
end
