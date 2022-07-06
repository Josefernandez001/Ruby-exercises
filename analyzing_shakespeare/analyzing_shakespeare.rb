# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# class Analyzing_Shakespeare
class AnalyzingShakespeare
  def analyzing
    lines_spoken = {}
    doc = Nokogiri::HTML(URI.open('http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'))
    all_speakers = doc.xpath('//speaker').remove.to_a
    all_speakers.each do |text|
      next if text.text.eql?('ALL')

      lines_spoken[text.text].nil?.eql?(false) ? lines_spoken[text.text] += 1 : lines_spoken[text.text] = 1
    end
    lines_spoken
  end
end

characters = AnalyzingShakespeare.new
puts characters.analyzing
