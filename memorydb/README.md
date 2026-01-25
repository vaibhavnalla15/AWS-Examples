# AWS MemoryDB Examples
# https://docs.aws.amazon.com/cli/v1/userguide/cli_memorydb_code_examples.html

# 1. Create a Subnet Group
```bash
aws memorydb create-subnet-group \
--subnet-group-name mysubnetgroup \
--description "my subnet group" \
--subnet-ids subnet-0cdcf2b13bc71ce47
```

# 2. Create a User
```bash
aws memorydb create-user \
--user-name bettercallsaul \
--access-string "on ~* &* +@all" \
--authentication-mode Passwords="789456123",Type=password
```

# 3. Create an Access Control List (ACL)
```bash
aws memorydb create-acl \
--acl-name "new-acl-1" \
--user-names "bettercallsaul"
```

# 4. Create a MemoryDB Cluster
```bash
aws memorydb create-cluster \
--cluster-name my-new-cluster \
--node-type db.t4g.small \
--acl-name my-acl \
--subnet-group my-sg
```

# This is it! Not moving further, because MemoryDB is a paid service. It is not allowing to create cluster in free tier.
# You can explore more examples at the official AWS CLI MemoryDB Code Examples page linked above.