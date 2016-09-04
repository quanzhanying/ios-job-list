class Job
  attr_accessor :id, :title, :content, :image_url

  def initialize(data)
    @id = data['id']
    @title = data['title']
    @content = data['content']
    @image_url = data['image_url']
  end

  def self.all(&callback)
    ApiClient.client.get 'jobs' do |response|
      models = []
      models = response.object.map { |data| new(data) } if response.success?
      callback.call(response, models)
    end
  end
end
