module TravisCustomDeploy

  module Transfer

    autoload :Sftp, 'travis-custom-deploy/transfer/sftp'
    autoload :Ftp, 'travis-custom-deploy/transfer/ftp'

  end

end
