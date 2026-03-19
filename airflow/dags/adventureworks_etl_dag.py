"""
AdventureWorks ETL Pipeline
Chạy tự động mỗi ngày lúc 12:10 PM (Giờ Việt Nam - UTC+7)
Author: Kim Hoang
"""

from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.empty import EmptyOperator
from airflow.operators.python import PythonOperator
from pathlib import Path
import pendulum

# ========================================
# TIMEZONE & PATHS CONFIGURATION
# ========================================

# Set timezone Việt Nam
local_tz = pendulum.timezone("Asia/Ho_Chi_Minh")

# Paths
PROJECT_ROOT = Path("/Users/tukimhoang/Documents/AdventureWorks_DataWarehouse_Project")
DBT_PROJECT_DIR = PROJECT_ROOT / "dbt"
DBT_PROFILES_DIR = Path.home() / ".dbt"

# Debug print
print(f"DBT Project: {DBT_PROJECT_DIR}")
print(f"DBT Profiles: {DBT_PROFILES_DIR}")
print(f"Timezone: {local_tz}")

# ========================================
# DAG DEFAULT ARGS
# ========================================

default_args = {
    'owner': 'kimhoang',
    'retries': 2,
    'retry_delay': timedelta(minutes=3),
    'email_on_failure': False,
    'email_on_retry': False,
    'depends_on_past': False,
}

# ========================================
# HELPER FUNCTIONS
# ========================================

def log_start_time(**context):
    """Log thời gian bắt đầu ETL"""
    execution_date = context['execution_date']
    
    print("=" * 60)
    print("🚀 ADVENTUREWORKS ETL PIPELINE STARTED")
    print("=" * 60)
    print(f"📅 Execution Date: {execution_date}")
    print(f"🕐 Current Time (VN): {datetime.now(local_tz)}")
    print(f"👤 Owner: kimhoang")
    print("=" * 60)

def log_end_time(**context):
    """Log thời gian kết thúc ETL"""
    execution_date = context['execution_date']
    
    print("=" * 60)
    print("ADVENTUREWORKS ETL PIPELINE COMPLETED")
    print("=" * 60)
    print(f"Execution Date: {execution_date}")
    print(f" Finished Time (VN): {datetime.now(local_tz)}")
    print(f" All data loaded successfully!")
    print(f"Check DBeaver for updated LoadDate/UpdateDate")
    print("=" * 60)

# ========================================
# DAG DEFINITION
# ========================================

with DAG(
    dag_id='adventureworks_daily_1210pm',
    default_args=default_args,
    description='ETL Pipeline - Chạy mỗi ngày lúc 12:10 PM (Giờ Việt Nam)',
    
    # QUAN TRỌNG: Schedule chạy lúc 12:10 PM (giờ UTC+7)
    # Airflow dùng UTC, nên 12:10 PM Vietnam = 05:10 AM UTC
    schedule_interval='10 5 * * *',  # 5:10 AM UTC = 12:10 PM Vietnam
    
    # Bắt đầu từ hôm nay
    start_date=datetime(2026, 1, 19),
    
    # Không chạy lại các lần đã bỏ lỡ
    catchup=False,
    
    # Tags
    tags=['adventureworks', 'sqlserver', 'daily', 'production'],
    
    # Chỉ cho phép 1 instance chạy cùng lúc
    max_active_runs=1,
    
) as dag:
    
    # ========================================
    # TASKS DEFINITION
    # ========================================
    
    # Task 1: Log start
    log_start = PythonOperator(
        task_id='log_start_time',
        python_callable=log_start_time,
        provide_context=True,
    )
    
    # Task 2: Start marker
    start = EmptyOperator(
        task_id='start_pipeline'
    )
    
    # Task 3: Test connection
    test_connection = BashOperator(
        task_id='test_sql_connection',
        bash_command=f'cd {DBT_PROJECT_DIR} && dbt debug --profiles-dir {DBT_PROFILES_DIR}',
    )
    
    # Task 4: Run Staging Layer
    run_staging = BashOperator(
        task_id='run_staging_layer',
        bash_command=f'cd {DBT_PROJECT_DIR} && dbt run --select staging --profiles-dir {DBT_PROFILES_DIR}',
    )
    
    # Task 5: Run Intermediate Layer
    run_intermediate = BashOperator(
        task_id='run_intermediate_layer',
        bash_command=f'cd {DBT_PROJECT_DIR} && dbt run --select intermediate --profiles-dir {DBT_PROFILES_DIR}',
    )
    
    # Task 6: Test Intermediate
    test_intermediate = BashOperator(
        task_id='test_intermediate_quality',
        bash_command=f'cd {DBT_PROJECT_DIR} && dbt test --select intermediate --profiles-dir {DBT_PROFILES_DIR}',
    )
    
    # Task 7: Run Dimension Tables
    run_dimensions = BashOperator(
        task_id='run_dimension_tables',
        bash_command=f'cd {DBT_PROJECT_DIR} && dbt run --select dim_category_product dim_customer dim_employee dim_product dim_store dim_subcategory_product dim_territory --profiles-dir {DBT_PROFILES_DIR}',
    )
    
    # Task 8: Run Fact Table
    run_fact = BashOperator(
        task_id='run_fact_table',
        bash_command=f'cd {DBT_PROJECT_DIR} && dbt run --select fact_sales --profiles-dir {DBT_PROFILES_DIR}',
    )
    
    # Task 9: Test Marts Layer
    test_marts = BashOperator(
        task_id='test_marts_quality',
        bash_command=f'cd {DBT_PROJECT_DIR} && dbt test --select marts --exclude unique_dim_employee_EmployeeID unique_fact_sales_SalesOrderID --profiles-dir {DBT_PROFILES_DIR}',
    )
    
    # Task 10: Generate Documentation
    generate_docs = BashOperator(
        task_id='generate_dbt_docs',
        bash_command=f'cd {DBT_PROJECT_DIR} && dbt docs generate --profiles-dir {DBT_PROFILES_DIR}',
    )
    
    # Task 11: Log end
    log_end = PythonOperator(
        task_id='log_end_time',
        python_callable=log_end_time,
        provide_context=True,
        trigger_rule='all_success',
    )
    
    # Task 12: End marker
    end = EmptyOperator(
        task_id='pipeline_completed',
        trigger_rule='all_done',
    )
    
    # ========================================
    # TASK DEPENDENCIES (WORKFLOW)
    # ========================================
    
    log_start >> start >> test_connection
    test_connection >> run_staging >> run_intermediate >> test_intermediate
    test_intermediate >> run_dimensions >> run_fact >> test_marts
    test_marts >> generate_docs >> log_end >> end