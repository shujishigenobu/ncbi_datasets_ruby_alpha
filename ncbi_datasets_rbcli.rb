require 'open-uri'

baseurl = "https://api.ncbi.nlm.nih.gov/datasets/v1"

db = ARGV[0] # genome | gene | protein | virus | taxonomy 
query = ARGV[1]
url = nil
case db
when "gene" || "g"

  url = baseurl + "/gene/" + URI.encode(query)

when "taxonomy", "t"
  url = baseurl + "/taxonomy/" + URI.encode(query)

else
  raise
end

uri = URI.parse(url)
STDERR.puts uri

puts uri.open.read
