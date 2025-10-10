import boto3
import os

def aws_credential_env(env_file='.env.aws', profile_name='default'):
    """Save AWS credentials from current boto3 session to .env file"""
    session = boto3.Session()
    credentials = session.get_credentials()
    
    if not credentials:
        raise ValueError("No AWS credentials found in current session")
    
    # Build env content
    env_lines = [
        f"AWS_ACCESS_KEY_ID={credentials.access_key}",
        f"AWS_SECRET_ACCESS_KEY={credentials.secret_key}"
    ]
    
    if credentials.token:
        env_lines.append(f"AWS_SESSION_TOKEN={credentials.token}")
    
    region = session.region_name or 'us-east-1'
    env_lines.append(f"AWS_DEFAULT_REGION={region}")
    
    env_content = '\n'.join(env_lines)
    
    # Write to .env file
    with open(env_file, 'w') as f:
        f.write(env_content)
    
    print(f"AWS credentials saved to {env_file}")

if __name__ == '__main__':
    aws_credential_env()