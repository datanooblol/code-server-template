#!/bin/bash
echo "Creating AWS .env file for Linux..."

# Get AWS credentials from AWS CLI
AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
AWS_DEFAULT_REGION=$(aws configure get region)

# Set default region if not configured
if [ -z "$AWS_DEFAULT_REGION" ]; then
    AWS_DEFAULT_REGION="us-east-1"
fi

# Create .env file
cat > .env << EOF
AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION
EOF

# Add session token if available
if [ ! -z "$AWS_SESSION_TOKEN" ]; then
    echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> .env
fi

echo "Done! .env file created with AWS credentials."