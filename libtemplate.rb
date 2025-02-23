require 'net/http'
require 'shellwords'
require 'uri'

# https://docs.ruby-lang.org/en/master/Net/HTTP.html#class-Net::HTTP-label-Following+Redirection
def fetch(uri, limit = 10)
  raise ArgumentError, 'Too many HTTP redirects' if limit == 0

  res = Net::HTTP.get_response(URI(uri))
  case res
  when Net::HTTPSuccess
    res
  when Net::HTTPRedirection
    location = res['Location']
    fetch(location, limit - 1)
  else
    res.value
  end
end

def load_sha256sums(uri)
  res = fetch uri
  Hash[res.body.lines.map { |s| s.shellsplit.reverse }]
end
