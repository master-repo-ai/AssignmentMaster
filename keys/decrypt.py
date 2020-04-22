from cryptography.fernet import Fernet
import sys
import os


def decrypt(student_id, security_key):
    if 'keys' in os.getcwd():
        wd = '.'
    else:
        wd = './keys'
    for root, dir, files in os.walk(wd):
        for file in files:
            if 'encrypted' in file:
                # try to decrypt it
                key = Fernet(security_key)
                with open(os.path.join(root, file), 'rb') as f:
                    encrypted_data = f.read()
                try:
                    decrypted_data = key.decrypt(encrypted_data)
                    path_to_save = os.path.join(wd, student_id)
                    with open(path_to_save, 'wb') as f:
                        f.write(decrypted_data)
                except:
                    print('')

if __name__ == '__main__':
    decrypt('student_0001', 'jOUmFYXhEnB-4vs8rVrk14VlXEj5SSMrCy2mGKtw7ag=')