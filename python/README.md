# This is a template for using python with uv package manager.

## Run this only if don't have pyproject.toml
```bash
uv init . -p python3.xx
```

## Sagemaker AI user
```bash
uv sync
uv add boto3 python-dotenv
uv run aws_credential_env.py
```

```bash
docker-compose up --build
```

### access
- https://<sagemaker-notebook-instance-name>.<aws-region>.sagemaker.aws/proxy/8080/

## Run this at the top of any jupyter or script
```python
from dotenv import load_dotenv
load_dotenv('.env.local', override=True)
```