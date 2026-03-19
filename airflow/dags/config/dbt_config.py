"""
Cấu hình cho dbt project
"""
import os
from pathlib import Path

# Đường dẫn tới dbt project
PROJECT_ROOT = Path(__file__).parent.parent.parent.parent
DBT_PROJECT_DIR = PROJECT_ROOT / "dbt"
DBT_PROFILES_DIR = Path.home() / ".dbt"

# Command templates
DBT_RUN_CMD = f"cd {DBT_PROJECT_DIR} && dbt run --profiles-dir {DBT_PROFILES_DIR}"
DBT_TEST_CMD = f"cd {DBT_PROJECT_DIR} && dbt test --profiles-dir {DBT_PROFILES_DIR}"
DBT_DOCS_CMD = f"cd {DBT_PROJECT_DIR} && dbt docs generate --profiles-dir {DBT_PROFILES_DIR}"

# Models theo layer
STAGING_MODELS = "staging"
INTERMEDIATE_MODELS = "intermediate"
MARTS_MODELS = "marts"