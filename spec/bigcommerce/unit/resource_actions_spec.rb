# frozen_string_literal: true

RSpec.describe Bigcommerce::ResourceActions do
  let(:klass) { Bigcommerce::DummyResourceActionsClass }
  let(:params) do
    { page: 1 }
  end

  it 'has options' do
    mod = Bigcommerce::ResourceActions.new(
      uri: 'http://foo.bar',
      disable: [:find, :all]
    )
    options = {
      uri: 'http://foo.bar',
      disable: [:find,:all]
    }
    expect(mod._options).to eq options
  end

  describe '#all' do
    subject { klass.all(params) }

    let(:expected_url) { 'http://foo.bar'}

    it 'makes a get request to the correct route with query params' do
      expect(klass).to receive(:get).with(expected_url, params)
      subject
    end

    context 'without params' do
      let(:params) { {} }

      it 'makes a get request to the correct route' do
        expect(klass).to receive(:get).with(expected_url, params)
        subject
      end
    end
  end

  describe '#find' do
    subject { klass.find(1) }

    let(:expected_url) { 'http://foo.bar/1' }
    let(:params) { {} }

    it 'makes a get request to the correct route' do
      expect(klass).to receive(:get).with(expected_url, params)
      subject
    end
  end

  describe '#create' do
    subject { klass.create(params) }

    let(:expected_url) { 'http://foo.bar' }

    it 'makes a post request to the correct route with params' do
      expect(klass).to receive(:post).with(expected_url, params)
      subject
    end
  end

  describe '#update' do
    subject { klass.update(1, params) }

    let(:expected_url) { 'http://foo.bar/1' }

    it 'makes a put request to the correct route with params' do
      expect(klass).to receive(:put).with(expected_url, params)
      subject
    end
  end

  describe '#destroy' do
    subject { klass.destroy(1) }

    let(:expected_url) { 'http://foo.bar/1' }
    let(:params) { {} }

    it 'makes a delete request to the correct route with params' do
      expect(klass).to receive(:delete).with(expected_url, params)
      subject
    end
  end

  describe '#destroy_all' do
    subject { klass.destroy_all }

    let(:expected_url) { 'http://foo.bar' }
    let(:params) { {} }

    it 'should make a delete request to the correct route with params' do
      expect(klass).to receive(:delete).with(expected_url, params)
      subject
    end
  end
end
