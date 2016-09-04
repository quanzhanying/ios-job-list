class ApiClient
  class << self
    def client
      @client ||= AFMotion::SessionClient.build('http://localhost:3000/') do
        header 'Accept', 'application/json'
        response_serializer :json
      end
    end

    def update_authorization_header(header)
      client.headers['Authorization'] = header
    end
  end
end
