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
  end
end
