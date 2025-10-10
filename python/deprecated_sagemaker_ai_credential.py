import boto3
import os

def create_aws_config_from_session(profile_name='default', output_dir='/home/ec2-user/.aws'):
    """Create AWS config files using current boto3 session credentials"""
    message = input(f"This will overwrite existing AWS config in {output_dir}. Continue? (y/n): ")
    if message.lower() != 'y':
        print("Aborted.")
        return
    # Get current session
    session = boto3.Session()
    credentials = session.get_credentials()
    
    if not credentials:
        raise ValueError("No AWS credentials found in current session")
    
    # Create directory
    os.makedirs(output_dir, exist_ok=True)
    
    # Build credentials content
    creds_content = f"""[{profile_name}]
aws_access_key_id = {credentials.access_key}
aws_secret_access_key = {credentials.secret_key}"""
    
    if credentials.token:
        creds_content += f"\naws_session_token = {credentials.token}"
    
    # Build config content
    region = session.region_name or 'us-east-1'
    config_content = f"""[{profile_name}]
region = {region}
output = json
"""
    
    # Write files
    with open(f'{output_dir}/credentials', 'w') as f:
        f.write(creds_content)
    
    with open(f'{output_dir}/config', 'w') as f:
        f.write(config_content)
    
    # Set permissions
    os.chmod(f'{output_dir}/credentials', 0o600)
    os.chmod(f'{output_dir}/config', 0o644)
    
    print(f"AWS config created in {output_dir}/")

if __name__=='__main__':
    # Usage
    create_aws_config_from_session()