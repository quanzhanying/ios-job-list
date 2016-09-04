class Job
  attr_accessor :id, :title

  def initialize(data)
    @id = data['id']
    @title = data['title']
  end

  def self.all(&callback)
    ApiClient.client.get 'jobs' do |response|
      models = []
      models = response.object.map { |data| new(data) } if response.success?
      callback.call(response, models)
    end
  end
end
