import sys
with open('op.env', 'w') as f:
    for item in json.load(sys.stdin):
        addr = f'op://{item["vault"]["name"]}/{item["title"]}'
        env_var_prefix = f'TF_VAR_{item["title"].replace(" ", "_")}'

        category = item['category']

        if category == 'API_CREDENTIAL':
            f.write(f'{env_var_prefix}_credential = {addr}/credential\n')
            f.write(f'{env_var_prefix}_username = {addr}/username\n\n')

        if category == 'LOGIN':
            f.write(f'{env_var_prefix}_password = {addr}/password\n')
            f.write(f'{env_var_prefix}_username = {addr}/username\n\n')

        if category == 'SSH_KEY':
            f.write(f'{env_var_prefix}_public_key = echo -n "{addr}/public key" | base64\n')
            f.write(f'{env_var_prefix}_private_key = {addr}/private key\n\n')
