# Test hosts in aws using terraform
```
git clone https://github.com/desterhuizen/test_hosts
cd test-hosts
```
If you want to use the default VPC:
```
cd hosts
```
If you want a dedicated VPC:
```
cd cluster
```

Configure the AWS access
```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=
```

Setup configs for terraform
```
echo "{
    \"local-public-ip\": \"$(curl -s ifconfig.co)/32\",
    \"ssh-public-key\": \"$(ssh-keygen -y -f yourkey.pem)\",
    \"owner\": \"name.surname\",
    \"region\": \"us-east-1\"
}" > terraform.tfvars.json
```

It defaults amazon-linux2 to use RedHat do the following:
```
sed -i 's/\.aws-linux\./\.rhel-linux\./g' hosts.tf
```

Build the hosts and get their IP's
```
terraform apply

terraform show --json 
```

OR

```
terraform apply
terraform show --json | jq -r '.values.root_module.resources[].values | select (.instance_type != null) | .public_ip 
```
