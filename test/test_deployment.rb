require 'helper'

class TestDeployment < Test::Unit::TestCase

  context "A deployment" do
    setup do
      @opts = {
        :type => 'sftp',
        :host => 'example.org',
        :username => 'username',
        :password => 'password',
        :remotedir => '/public/'
      }
    end

    context "with files" do
      setup do
        @deployment = Deployment.new(@opts, ['foo', 'bar', 'foo2'])
      end

      should "return file names" do
        assert_equal ['foo', 'bar', 'foo2'], @deployment.files
      end
    end

    context "with service identifier as first file name" do
      setup do
        @deployment = Deployment.new(@opts, ['service:jekyll'])
      end

      should "return file names of service" do
        assert_equal ['_site/'], @deployment.files
      end
    end
  end
end
