module TravisCustomDeploy

  # The available services. Each service has an
  # unique id and an array of files or directories to deploy.
  SERVICES = {

    # Jekyll support
    # Usage: service:jekyll
    'jekyll' => [ '_site/' ]
  }

  # The possible options of the different transfer types
  OPTIONS = {

    'sftp' => [ 
      'host',        # host name of the sftp server
      'username',    # username to connect
      'password',    # password to connect
      'remotedir'    # remote dir, for example: /public/
    ],

    'ftp' => [
      'host',        # host name of the ftp server      
      'username',    # username to connect
      'password',    # password to connect
      'remotedir'    # remote dir, for example: /public/
    ],

    'copy' => [
      'remotedir'    # the destination where to copy the files 
    ]

  }

  class Options

    # Returns the options for the corresponding transfer type
    #
    # transfer_type - the transfer type
    #
    # Returns an array of options, which must be available
    def self.get_options(transfer_type)
      OPTIONS.each do |k,v|
        if k == transfer_type
          return v
        end
      end
      nil
    end
  end
end
