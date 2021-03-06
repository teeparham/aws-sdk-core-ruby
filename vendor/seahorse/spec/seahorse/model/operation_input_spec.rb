require 'spec_helper'

module Seahorse
  module Model
    describe Operation do
      let(:input_hash) do
        {
          'params' => {
            'body1' => { 'type' => 'string' },
            'body2' => { 'type' => 'string', 'location' => 'body' },
            'body3' => { 'type' => 'string', 'location' => 'body' },
            'uri1' => { 'type' => 'string', 'location' => 'uri' },
            'uri2' => { 'type' => 'string', 'location' => 'uri' },
            'header1' => { 'type' => 'string', 'location' => 'header' }
          },
          'raw_payload' => true
        }
      end

      let(:input) { OperationInput.from_hash(input_hash) }

      describe 'from_hash' do
        it 'loads from a hash' do
          params = input.params
          expect(params.values.map(&:class).uniq).to eq [Shapes::StringShape]
          expect(input.raw_payload).to eq true
        end

        it 'serializes to a hash' do
          expect(input.to_hash).to eq(input_hash)
        end
      end

      describe '#body_params' do
        it 'loads all body parameters' do
          expect(input.body_params.keys).to eq [:body1, :body2, :body3]
        end
      end

      describe '#uri_params' do
        it 'loads all URI parameters' do
          expect(input.uri_params.keys).to eq [:uri1, :uri2]
        end
      end

      describe '#header_params' do
        it 'loads all header parameters' do
          expect(input.header_params.keys).to eq [:header1]
        end
      end
    end
  end
end
