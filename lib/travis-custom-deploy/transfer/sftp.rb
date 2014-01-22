require 'net/sftp'

module TravisCustomDeploy

  module Transfer

    # The class which transfers files via the SSH File Transfer Protocol
    # (SFTP). 
    class Sftp < Base

      def initialize(options, files)
        super(options, files)
        prepare_remotedir
      end

      def transfer
        Net::SFTP.start(@options['host'], @options['username'], :password => @options['password']) do |sftp|
          for e in @files
            if File.directory?(e)
              send_dir(sftp, e, @remotedir)
            else
              sftp.upload!(e, @remotedir + "/" + File.basename(e))
            end
          end
        end
      end

      # Check if the passed arguments are sufficient
      def check_options(options)
        raise ArgumentError, 'host name must not be nil' if options['host'].nil?
        raise ArgumentError, 'userna)e must not be nil' if options['username'].nil?
        raise ArgumentError, 'password must not be nil' if options['password'].nil?
      end

      # Sends a directory to the remote server with the given parameters
      #
      # sftp - the SFTP connection
      # dir - the local dir to transfer
      # the remote folder where to place the files
      def send_dir(sftp, dir, remote)
        Dir.foreach(dir) do |file_name|
          next if file_name =~ /^(\.|\.\.)$/

          localfile = File.join(dir, file_name)
          if File.directory?(localfile)
            begin 
              sftp.mkdir!(remote + "/" + file_name)
            rescue Net::SFTP::StatusException
              # the directory probably already exists
            end
            send_dir(sftp, File.join(dir, file_name), File.join(remote, file_name))
          else
            sftp.upload!(File.join(dir, file_name), File.join(remote, file_name))
          end
        end
      end

      # Prepares the remote directory (remote trailing slash)
      def prepare_remotedir
        @remotedir = @options['remotedir']
        @remotedir = "" if @remotedir.nil?
        @remotedir = @remotedir[0..-2] if @remotedir[-1] == "/"
      end

    end
  end
end
