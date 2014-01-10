module TravisCustomDeploy

  module Transfer

    class Base

      attr_reader :remoteopts
      attr_reader :files

      def initialize(remoteopts, files)
        @remoteopts = remoteopts
        @files = files
        prepare_remotedir
      end

      # The method which needs to be implemented by subclasses
      # of transfer types. 
      def transfer
        raise NotImplementedError 
      end

      # Prepares the remote directory (remote trailing slash)
      def prepare_remotedir
        @remotedir = @remoteopts[:remotedir]
        @remotedir = "" if @remotedir.nil?
        @remotedir = @remotedir[0..-2] if @remotedir[-1] == "/"
      end
    end
  end
end
