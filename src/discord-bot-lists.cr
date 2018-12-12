require "http/client"
require "json"

module Dbl
  def post_stats(clients : Hash(String, String), cache : Discord::Cache, time : Time::Span = 30.minutes)
    clients.each do |url, token|
      post_stats(url, token, cache, time)
    end
  end

  private def post_stats(url : String, authorization_token : String, cache : Discord::Cache, time : Time::Span = 30.minutes)
    client = HTTP::Client.new(url, tls: true)
    cache = cache.as(Discord::Cache)

    client.before_request do |req|
      req.headers["Authorization"] = authorization_token
      req.headers["content-type"] = "application/json"
    end

    spawn do
      loop do
        sleep time
        begin
          case url
          when "discordbots.org"
            endpoint = "/api/bots/stats"
            body = {server_count: cache.guilds.size}
          when "discord.bots.gg"
            endpoint = "/api/v1/bots/#{cache.resolve_current_user.id}/stats"
            body = {guildCount: cache.guilds.size}
          else
            raise "Unsupported List. Currently bots.gg and DBL are supported"
          end

          client.post(endpoint, body: body.to_json) do |res|
            raise "Error: #{res.body}" unless res.success?
          end
        rescue
        end
      end
    end
  end
end
