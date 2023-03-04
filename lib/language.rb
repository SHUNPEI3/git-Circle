require 'base64'
require 'json'
require 'net/https'

module Language
  class << self
    def get_category(text)
      # APIのURL作成
      api_url = "https://language.googleapis.com/v1/documents:classifyText?key=#{ENV['GOOGLE_API_KEY']}"
      # APIリクエスト用のJSONパラメータ
      params = {
        document: {
          type: 'PLAIN_TEXT',
          content: text
        },
        classificationModelOptions: {
          v2Model: {
            contentCategoriesVersion: 'V2',
          }
        }
      }.to_json
      # Google Cloud Natural Language APIにリクエスト
      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)
      # APIレスポンス出力
      response_body = JSON.parse(response.body)
      if (error = response_body['error']).present?
        raise error['message']
      else
        categories = response_body["categories"].pluck('name').take(1)
        categories.each do |category|
          new_category = category.split('/').slice(1)
          return new_category
        end
      end
    end
  end
end