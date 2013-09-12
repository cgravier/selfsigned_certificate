require 'minitest/spec'

describe_recipe 'selfsigned_certificate' do
	it "installed the unzip package" do
		package("unzip").must_be_installed
	end
end
