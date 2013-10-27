require_relative "./support/helpers"

describe_recipe 'selfsignedcertificate_test::default' do
  include SelfsignedCertificateTestHelpers
  it "certificate must exist" do
    file("#{node['selfsigned_certificate']['destination']}/server.csr").must_exist
  end
end
