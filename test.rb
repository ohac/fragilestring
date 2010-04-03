#!/usr/bin/ruby
require 'lib/fragilestring.rb'

if ARGV.size > 0
  case ARGV[1]
  when 'reset'
    Pit.set("fragilestring")
  when 'change'
    ENV["USERNAME"] = rand.to_s
  end
end
thesecret = FragileString.get do
  FragileString.put('thesecret')
end
p thesecret
