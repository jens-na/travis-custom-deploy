module TravisCustomDeploy

  module Transfer

    class Copy < Base

      def initialize
        super(@remoteopts, files)
      end
    end
  end
end
