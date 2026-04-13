#  DE AdventureWorks2019 – Data Pipeline với dbt & Airflow

##  Tổng quan

Dự án này xây dựng một **pipeline dữ liệu end-to-end** sử dụng dataset AdventureWorks2019, áp dụng các công cụ hiện đại trong Data Engineering như **dbt** và **Apache Airflow**.

Mục tiêu:

* Xây dựng pipeline dữ liệu tự động
* Chuẩn hóa dữ liệu phục vụ phân tích
* Thiết kế Data Warehouse theo mô hình Star Schema

---

##  Kiến trúc hệ thống

Pipeline được thiết kế theo hướng hiện đại:

```bash
Source (AdventureWorks2019)
        ↓
Raw Database
        ↓
dbt (Transform)
        ↓
Data Warehouse (Star Schema)
        ↓
Airflow (Orchestration & Scheduling)

```

---

##  Công nghệ sử dụng

* **dbt (Data Build Tool)** – Transform & modeling dữ liệu
* **Apache Airflow** – Orchestration pipeline
* **Docker** – Quản lý môi trường chạy
* **SQL** – Xử lý dữ liệu (trong dbt models)

---

##  Cấu trúc dự án

```bash
.
├── airflow/                # Airflow DAGs & config
│   ├── dags/
│   ├── logs/
│   ├── plugins/
│
├── dbt/                   # dbt project
│   ├── models/
│   ├── macros/
│   ├── dbt_project.yml
│
├── docker-compose.yml     # Setup Airflow bằng Docker
├── logs/                  # Log hệ thống
├── target/                # Output của dbt (ignore khi push)
└── README.md
```

---

## Mô hình dữ liệu

Sử dụng **Star Schema**:

###  Fact Tables

* `fact_sales`

###  Dimension Tables

* `dim_customer`
* `dim_product`
* `dim_store`
* `dim_date`

---

## Quy trình xử lý dữ liệu

1. Dữ liệu từ AdventureWorks được load vào database
2. dbt thực hiện:

   * Clean dữ liệu (`staging`)
   * Transform (`intermediate`)
   * Build model (`mart`)
3. Airflow:

   * Trigger dbt run
   * Schedule pipeline tự động

---

## Cách chạy dự án

### 1. Clone repo

```bash
git clone https://github.com/KimHoang-1802/DE_Advaturework2019.git
cd DE_Advaturework2019
```

### 2. Chạy Airflow bằng Docker

```bash
docker-compose up -d
```

### 3. Chạy dbt

```bash
cd dbt
dbt run
dbt test
```




---

##  Hướng phát triển

* Tích hợp BI tool (Power BI / Metabase)
* Thêm data quality tests (dbt tests nâng cao)


---

## Tác giả

**Kim Hoàng**
Data Engineer (Aspiring) 🚀
