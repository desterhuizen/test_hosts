```
git clone 
cd test-hosts
```

```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=
```

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

```
terraform apply

terraform show --json 
```

OR

```
terraform apply
terraform show --json | jq -r '.values.root_module.resources[].values | select (.instance_type != null) | .public_ip 
```
