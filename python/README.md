# This is a template for using python with uv package manager.

# Sagemaker AI user
```bash
uv sync
uv add boto3
uv run sagemaker_s3_credential.py
```

```bash
docker-compose up --build
```

## access
- https://<sagemaker-notebook-instance-name>.<aws-region>.sagemaker.aws/proxy/8080/