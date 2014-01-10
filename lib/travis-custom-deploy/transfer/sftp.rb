require 'net/sftp'

module TravisCustomDeploy

  module Transfer

    class Sftp < Base

      def initialize(remoteopts, files)
        super(remoteopts, files)
      end

      # transfers the given files via sftp
      def transfer
        Net::SFTP.start(@remoteopts[:host], @remoteopts[:username], :password => @remoteopts[:password]) do |sftp|
          for e in @files
            sftp.upload!(e, "#{@remotedir}/")
          end
        end
      end


    end
  end
end
