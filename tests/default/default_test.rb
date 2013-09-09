require 'minitest/spec'

class Selfsigned_certificateSpec < MiniTest::Chef::Spec

	describe_recipe  'selfsigned_certificate::default' do
		it "installed the unzip package" do
			package("unzip").must_be_installed
		end
	end

	describe_recipe  'selfsigned_certificate::default' do
		it "installed the unzip package" do
			assert_directory "/etc", "root", "root", "755"
		end
	end

end
