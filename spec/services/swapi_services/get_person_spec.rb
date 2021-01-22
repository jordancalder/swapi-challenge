require 'rails_helper'

RSpec.describe SwapiServices::GetPerson do
  let(:id) { 1 }

  subject { described_class.new(id: id).call }

  describe '#call' do

    context 'when remote request fails' do
      let(:payload) { OpenStruct.new({ body: { detail: 'not found' } }) }
      before do
        allow(HTTParty).to receive(:get).and_return(payload)
      end

      it 'returns a failing response with message' do
        expect(subject.success?).to eq(false)
        expect(subject.error).to eq(payload['detail'])
      end
    end
  end
end
