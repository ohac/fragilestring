#!/usr/bin/ruby
require 'lib/fragilestring.rb'

if ARGV.size > 0
  case ARGV[0]
  when 'reset'
    Pit.set("fragilestring", :data => {})
  when 'change'
    ENV["USERNAME"] = rand.to_s
  end
end
thesecret = FragileString.get do
  p :changed
  FragileString.put('thesecret')
end
p thesecret
