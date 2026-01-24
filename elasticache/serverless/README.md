# Create a Serverless Cache 

# Creating for Redis
```bash
aws elasticache create-serverless-cache \
--serverless-cache-name my-serverless-cache \
--engine redis \
--major-engine-version 7 
```

# Install Redis Client (Ubuntu)
```bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install redis-server -y
sudo service redis-server start
```
# Verify installation
redis-cli ping # should return PONG
 