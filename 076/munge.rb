module Munge
  class << self
    def munge_string(string)
      string.split(/\b/).map {|word| munge_word(word)}.join
    end

    def munge_word(word)
      return word unless mungable?(word)
      word[0] + word[1..-2].split(//).sort_by{rand}.join + word[-1]
    end

    private

    def mungable?(word)
      true if word =~ /\w{2,}/
    end
  end
end


if ARGV.empty?
  puts "Usage: ruby munge.rb FILE"
else
  puts Munge.munge_string File.open(ARGV[0]).read
end