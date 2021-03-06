require 'spec_helper'

module Seahorse
  module Client
    describe Response do

      describe '#context' do

        it 'defaults to a new context' do
          expect(Response.new.context).to be_kind_of(RequestContext)
        end

        it 'can be set in the constructor' do
          context = RequestContext.new
          expect(Response.new(context: context).context).to be(context)
        end

      end

      describe '#http_request' do

        it 'returns the context #http_request' do
          http_request = Http::Request.new
          context = RequestContext.new(http_request: http_request)
          resp = Response.new(context: context)
          expect(resp.http_request).to be(http_request)
        end

      end

      describe '#http_response' do

        it 'returns the context #http_response' do
          http_response = Http::Response.new
          context = RequestContext.new(http_response: http_response)
          resp = Response.new(context: context)
          expect(resp.http_response).to be(http_response)
        end

      end

      describe '#on_complete' do

        it 'triggers the callback when a response is received'

        it 'does not trigger when when a response is not received'

      end

      describe '#on_success' do

        it 'triggers the callback when response has a ~ 200 status code'

      end

      describe '#on_redirect' do

        it 'triggers the callback when response has a ~ 300 status code'

      end

      describe '#on_error' do

        it 'triggers the callback when response has a ~ 400 status code'

        it 'triggers the callback when response has a ~ 500 status code'

      end

      describe '#on_failure' do

        it 'triggers the callback when response has a 0 status code'

      end

    end
  end
end
