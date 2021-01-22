require 'rails_helper'

RSpec.describe SwapiServices::GetResource do
  let(:resource) { 'films' }
  let(:id) { 1 }
  let(:klass) { 'Films' }

  subject { described_class.new(resource: resource, id: id, klass: klass, is_resource_cachable: false).call }

  describe '#call' do

    context 'when remote request fails' do
      let(:payload) { OpenStruct.new({ body: '{ "detail": "not found" }' }) }
      before do
        allow(HTTParty).to receive(:get).and_return(payload)
      end

      it 'returns a failing response with message' do
        expect(subject.success?).to eq(false)
        expect(subject.error).to eq('not found')
      end
    end
  end
end
