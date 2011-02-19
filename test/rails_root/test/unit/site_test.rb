require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  test "Site.find_by_host_name" do
    assert_equal BigSite::Site.find_by_host_name("www.example.com"), sites(:one)
  end

  test "Site.find_by_host_name if the host name is mixed case" do
    assert_equal BigSite::Site.find_by_host_name("www.ExAmPlE.com"), sites(:one)
  end

  test "Site.find_by_host_name for subdomain on the parent service" do
    BigSite::service_configs[:service_domains] = ["example.com"]
    assert_equal BigSite::Site.find_by_host_name("second.example.com"), sites(:two)
  end
end
