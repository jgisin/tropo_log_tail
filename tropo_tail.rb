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
    begin
      puts "Please enter your Tropo Password"
      system 'stty -echo'
      @password = gets.chomp
      system 'stty echo'
    rescue
      system 'stty echo'
      exit
    end
    puts "Input 1 for full Tropo logs or 2 for truncated logs"
    @log_display = gets.chomp
  end

  def get_latest
    @ftp.list.each do |file|
      if file[-4..-1] == ".txt"
        @filename = file[-19..-1]
        puts @filename
      end
    end
  end

  def tail
    maxline = 0
    exit_state = 1
    while 0 < exit_state
      linecount = 0
      @ftp.gettextfile(@filename, nil) do |line|
        info = /(?<=PRISM )(\d{7}\/\d{7}\/)(\w{32}\/|0\/)(\w{32}\/)(1\/)(\S{1,50}\/)(\[\S{1,50}\])/.match(line).to_s.yellow
        linecount += 1
        if linecount > maxline
          maxline = linecount
          if @log_display == "1"
            puts "#{line[0..19].blue}#{line[21..50].yellow} #{info}#{line[(info.length + 38)..-1]}"
          elsif @log_display == "2"
            puts "#{line[0..19].blue} #{line[(info.length + 38)..-1]}"
          else
            puts "invalid log display option"
            return false
          end
        end
      end
      sleep 3
    end
  end

end

tt = TropoTail.new
