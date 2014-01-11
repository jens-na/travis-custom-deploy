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
        Net::SFTP.start(@options['host'], @options['username'], 
                        :password => @options['password']) do |sftp|
          for e in @files
            sftp.upload!(e, "#{@remotedir}/")
          end
        end
      end

      def check_options(options)
        raise ArgumentError, 'host name must not be nil' if options['host'].nil?
        raise ArgumentError, 'username must not be nil' if options['username'].nil?
        raise ArgumentError, 'password must not be nil' if options['password'].nil?
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
