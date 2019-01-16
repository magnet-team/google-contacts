module Support
  module ResponseMock
    def mock_response(body, method = :request_get)
      res_mock = double('Response')
      allow(res_mock).to receive(:body).and_return(body)
      allow(res_mock).to receive(:code).and_return('200')
      allow(res_mock).to receive(:message).and_return('OK')
      allow(res_mock).to receive(:header).and_return({})

      http_mock = double('HTTP')
      expect(http_mock).to receive(:use_ssl=).with(true)
      expect(http_mock).to receive(:verify_mode=)
        .with(OpenSSL::SSL::VERIFY_NONE)
      expect(http_mock).to receive(:start)

      if block_given?
        yield http_mock, res_mock
      else
        expect(http_mock).to receive(method).with(any_args).and_return(res_mock)
      end

      expect(Net::HTTP).to receive(:new).and_return(http_mock)
    end
  end
end
