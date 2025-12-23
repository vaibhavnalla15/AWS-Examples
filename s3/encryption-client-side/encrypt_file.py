from cryptography.fernet import Fernet

# load key
with open("secret.key", "rb") as key_file:
    key = key_file.read()

fernet = Fernet(key)

# read file
with open("./wick.txt", "rb") as file:
    original = file.read()

# encrypt
encrypted = fernet.encrypt(original)

# save encrypted file
with open("data.txt.encrypted", "wb") as encrypted_file:
    encrypted_file.write(encrypted)

print("File encrypted.")
