require 'digest'
require 'json'
require 'time'
require 'socket'

unless ARGV.length == 1
  puts 'Usage:'
  puts '  ruby catalog.rb <path/to/catalog/>'
  exit 1
end

Dir.chdir(ARGV.shift)
root = "#{Dir.pwd}/"

catalog = {
  user: Etc.getlogin,
  host: Socket.gethostname,
  root: root,
  date: Time.now.utc.iso8601,
  size: 0,
  parent: nil,
  runtime: nil,
  files: {}
}

Dir.glob("#{root}**/*", File::FNM_DOTMATCH).each do |f|
  next if File.directory?(f)

  catalog[:files][f.sub(root, '')] = Digest::SHA256.file(f).to_s
  catalog[:size] += File.size(f)
end

catalog[:runtime] = Time.now.utc - Time.parse(catalog[:date])
puts JSON.pretty_generate(catalog)
