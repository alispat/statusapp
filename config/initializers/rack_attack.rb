class Rack::Attack

  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

	safelist('allow-localhost') do |req|
		'127.0.0.1' == req.ip || '::1' == req.ip
	end

  blocklist('bad-robots') do |req|
  	req.ip if /\S+\.php/.match?(req.path)
  end

  throttle('req/ip', limit: 10, period: 1.seconds) do |req|
    req.ip
  end

end