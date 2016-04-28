#!/usr/bin/ruby

lib = File.expand_path("../../lib", __FILE__)
$:.unshift(lib)

require 'TF1SearchProvider'

term = ARGV[0]
#puts term
#puts quality

provider = TF1SearchProvider.new()

provider.search(term)
