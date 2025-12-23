import boto3
from cryptography.fernet import Fernet

# download
s3 = boto3.client("s3")
s3.download_file("encrypted-bucket-fun", "data.txt.encrypted", "downloaded.encrypted")

# load key
with open("secret.key", "rb") as key_file:
    key = key_file.read()

fernet = Fernet(key)

# decrypt
with open("downloaded.encrypted", "rb") as enc_file:
    encrypted_data = enc_file.read()

decrypted = fernet.decrypt(encrypted_data)

with open("decrypted_data.txt", "wb") as dec_file:
    dec_file.write(decrypted)

print("File decrypted successfully.")
