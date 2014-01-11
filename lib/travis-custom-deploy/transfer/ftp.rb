module TravisCustomDeploy

  module Transfer

    # The class which transfers files via the File Transfer protocol (FTP).
    class Ftp < Base

      def initialize(remoteopts, files)
        super(remoteopts, files)
      end

      def transfer
        
      end
    end
  end
end
