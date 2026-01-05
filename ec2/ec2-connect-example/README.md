# Generate ssh key

```bash
ssh-keygen -t rsa -b 4096 -f ec2connect
```

# Send ssh to public-key to ec2 instance
```bash
aws ec2-instance-connect send-ssh-public-key \
--instance-id i-02d7c91b55290d13f \
--instance-os-user ec2-user \
--availability-zone us-east-1c \
--ssh-public-key file://ec2connect.pub
```

# Connect to instance 
ssh -i "id_rsa" ec2-user@ipaddress