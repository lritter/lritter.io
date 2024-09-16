#!/usr/bin/env ruby

require "json"
require "optparse"
require "date"

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-f", "--file=PATH", "File to parse") do |f|
    options[:file] = f
  end

  opts.on("--format=FORMAT", "output format (json, md)") do |f|
    options[:format] = f
  end
end.parse!

libation_data = JSON.parse(File.read(options[:file]))

filtered_books = libation_data.each_with_object([]) do |book, books|
  next if book["BookStatus"] == "NotLiberated"

  books << book.slice("Title", "AuthorNames", "DateAdded").tap do |data|
    data["DateAdded"] = Date.parse(data["DateAdded"])
    data["Title"] = "#{book["Title"]}: #{book["Subtitle"]}" if book["Subtitle"].to_s.strip != ""
  end
end

# Sort books by descending "added" date
sorted_and_filtered = filtered_books.sort { |a, b| b["DateAdded"] <=> a["DateAdded"] }.each_with_object(Hash.new {|h,k| h[k] = []}) do |book, books|
  books[book["DateAdded"].strftime("%B, %Y")] << book
end

case options[:format]
when "json"
  puts JSON.pretty_generate(sorted_and_filtered)
when "md"
  sorted_and_filtered.each do |date, books|
    puts "### #{date}", ""
    books.each do |book|
      puts "- **#{book["Title"]}** by #{book["AuthorNames"]}", ""
    end
  end
else
  raise ArgumentError, "invalid output format"
end
