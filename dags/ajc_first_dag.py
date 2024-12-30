import airflow
from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python import PythonOperator

# Define the default arguments
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# Define the function to be executed
def greet():
    print("Hello, Airflow!")

# Define the DAG
with DAG(
    'first_dag_example',
    default_args=default_args,
    description='My first Airflow DAG',
    schedule_interval=timedelta(days=1),  # Runs daily
    start_date=datetime(2023, 1, 1),
    catchup=False,  # Disable backfilling
    tags=['example'],
) as dag:
    # Define the task
    hello_task = PythonOperator(
        task_id='say_hello',
        python_callable=greet,
    )

# Set task dependencies (if needed, in this case, it's a single task)
hello_task