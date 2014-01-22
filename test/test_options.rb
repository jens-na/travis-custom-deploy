require 'helper'

class TestOptions < Test::Unit::TestCase

  context "Options" do

    context "environment variables" do
      setup do
        @env = Options.get_options('sftp') 
      end

      should "return sftp options" do
        assert_equal ['host', 'username', 'password', 'remotedir'], @env
      end
    end

    context "no pull request variable" do
      setup do
        ENV['TRAVIS_PULL_REQUEST'] = nil
      end

      should "allow deployment" do
        assert_equal true, Options::deploy_allowed?
      end
    end

    context "pull request variable false" do
      setup do
        ENV['TRAVIS_PULL_REQUEST'] = "false"
      end

      should "allow deployment" do
        assert_equal true, Options::deploy_allowed?
      end
    end

    context "pull request variable with number" do
      setup do
        ENV['TRAVIS_PULL_REQUEST'] = "1000"
      end

      should "don't allow deployment" do
        assert_equal false, Options::deploy_allowed?
      end
    end
  end
end
