# Check if Terraform is functionnal

control 'terraform-01' do
  impact 1.0
  title 'Terraform install'
  desc 'Terraform should be functionnal'
  describe command('terraform -version') do
    its('exit_status') { should eq 0 }
  end
end
