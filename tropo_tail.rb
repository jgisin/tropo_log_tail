require 'net/ftp'
require 'colorize'

class TropoTail

  def initialize
    @ftp = Net::FTP.new('ftp.tropo.com')
    run
    @ftp.login(@username, @password)
    @ftp.chdir('logs')
    get_latest
    if @filename.nil?
      puts "No new logs"
    else
      tail
    end
  end

  def run
    puts "Please type your Tropo Username..."
    @username = gets.chomp
    puts "Please enter your Tropo Password"
    @password = gets.chomp
  end

  def get_latest
    @ftp.list.each do |file|
      if file[-4..-1] == ".txt"
        @filename = file[-19..-1]
      end
    end
  end

  def tail
    maxline = 0
    while 0 < 1
      linecount = 0
      @ftp.gettextfile(@filename, nil) do |line|
        linecount += 1
        if linecount > maxline
          maxline = linecount
          puts "#{line[0..19].blue}#{line[21..44].yellow}#{line[45..-1]}"
        end
      end
      sleep 3
    end
  end

end

tt = TropoTail.new
