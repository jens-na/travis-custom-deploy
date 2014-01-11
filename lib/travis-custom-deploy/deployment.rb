module TravisCustomDeploy

  class Deployment

    attr_reader :options
    attr_reader :files

    # Initializes a new deployment
    #
    # remteopts - the options to connect to the remote server
    # files - the files to transfer
    def initialize(transfer_type, options, files)
      raise ArgumentError, 'transfer type must not be nil' if transfer_type.nil?
      @files = files
      check_services(@files[0])
      @options = options
      @transfer = get_transfer(transfer_type)
    end

    # Starts the deployment
    def deploy
      @transfer.transfer
    end

    # Creates an instance for the transfer type and return it 
    #
    # type - the transfer type like sftp, ftp, etc.
    def get_transfer(type)
      type = type[0].upcase + type[1..-1]
      try_require(type)
      Transfer.const_get(type).new(@options, @files) 
    end

    # Try requiring a transfer type class 
    #
    # name - the name of the transfer type like: sftp, stp
    def try_require(name)
      require("travis-custom-deploy/transfer/#{name.downcase}")
      true
    end
    protected :try_require

    # Check if the first file matches service:<service-name>
    # and try to determine the files based on the service.
    #
    # first_file the first file given
    def check_services(first_file)
      if first_file.start_with?('service:')
        service = first_file.sub(/service:/, '')
        SERVICES.each do |k,v|
          if k == service
            @files = v
          end
        end
      end
    end

  end
end
