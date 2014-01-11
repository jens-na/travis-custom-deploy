module TravisCustomDeploy

  module Transfer

    class Base

      attr_reader :options
      attr_reader :files

      def initialize(options, files)
        @options = options
        @files = files
        check_options(options)
      end

      # The method which needs to be implemented by subclasses
      # of transfer types. 
      def transfer
        raise NotImplementedError 
      end

      # The method which needs to be implemented by subclasses
      # to check if the remote options are sufficient for the
      # defined transfer type
      def check_options
        raise NotImplementedError
      end

    end
  end
end
