\# Netflix MovieLens Data Pipeline



\## Project Overview



This project demonstrates an end-to-end data engineering workflow using MovieLens data, AWS S3, Snowflake, and dbt.



The goal is to build a structured data pipeline that ingests raw movie-related data, transforms it using dbt, and creates analytics-ready tables in Snowflake.



\## Architecture \& Data Flow



```text

MovieLens CSV Files

&#x20;       |

&#x20;       v

&#x20;    AWS S3

&#x20;       |

&#x20;       v

&#x20;Snowflake RAW Schema

&#x20;       |

&#x20;       v

&#x20;   dbt Transformations

&#x20;       |

&#x20;       v

&#x20;Snowflake DEV Schema

&#x20;       |

&#x20;       +-------------------+

&#x20;       |                   |

&#x20;       v                   v

&#x20;Staging Views        Dimension Tables

&#x20;                           |

&#x20;                           v

&#x20;                      Fact Tables

```



\### Data Flow Steps



1\. \*\*Data Source:\*\* Downloaded MovieLens datasets containing movies, ratings, tags, links, and genome-related information.

2\. \*\*Cloud Storage:\*\* Uploaded the CSV files to an AWS S3 bucket.

3\. \*\*Data Ingestion:\*\* Connected AWS S3 to Snowflake and loaded the source data into raw tables under the `RAW` schema.

4\. \*\*Data Transformation:\*\* Configured dbt with the Snowflake adapter to transform raw data.

5\. \*\*Staging Layer:\*\* Created staging views to select and standardize source columns.

6\. \*\*Dimension Layer:\*\* Created dimension tables for movies, users, and genome tags.

7\. \*\*Fact Layer:\*\* Created a fact table for genome scores.



\## Technology Stack



| Technology | Purpose |

|---|---|

| AWS S3 | Cloud storage for source CSV files |

| Snowflake | Cloud data warehouse |

| dbt Core | Data transformation and modeling |

| dbt-Snowflake | Snowflake adapter for dbt |

| SQL | Data transformation |

| Python | dbt execution environment |

| Git \& GitHub | Version control and project management |



\## dbt Project Structure



```text

netflix/

│

├── analyses/

├── macros/

├── models/

│   ├── staging/

│   │   ├── src\_genome\_scores.sql

│   │   ├── src\_genome\_tags.sql

│   │   ├── src\_links.sql

│   │   ├── src\_movies.sql

│   │   ├── src\_ratings.sql

│   │   └── src\_tags.sql

│   │

│   ├── dim/

│   │   ├── dim\_genome\_tags.sql

│   │   ├── dim\_movies.sql

│   │   └── dim\_users.sql

│   │

│   └── fact/

│       └── fact\_genome\_scores.sql

│

├── seeds/

├── snapshots/

├── tests/

├── dbt\_project.yml

├── .gitignore

└── README.md

```



\## dbt Materialization Strategy



The project uses different materializations based on the transformation layer.



\- \*\*Staging models:\*\* Materialized as views.

\- \*\*Dimension models:\*\* Materialized as tables.

\- \*\*Fact models:\*\* Materialized as tables.



The materialization settings are configured at the folder level in `dbt\_project.yml`.



\## Snowflake Schema Design



Two schemas are used to separate source data from transformation outputs.



\- \*\*RAW:\*\* Stores the source data ingested from AWS S3.

\- \*\*DEV:\*\* Stores dbt-generated staging views, dimension tables, and fact tables.



This separation keeps the original raw data independent of transformation activities.



\## Project Setup



\### 1. Clone the repository



```bash

git clone https://github.com/KarellaReshma560/Netflix-MovieLens-Data-Pipeline.git

cd Netflix-MovieLens-Data-Pipeline

```



\### 2. Create and activate a Python virtual environment



```powershell

python -m venv venv

.\\venv\\Scripts\\Activate.ps1

```



\### 3. Install dbt-Snowflake



```bash

pip install dbt-snowflake==1.9.0

```



\### 4. Configure Snowflake connection



Configure your Snowflake connection in the dbt `profiles.yml` file located in your user-level `.dbt` directory.



Do not commit passwords or other sensitive credentials to GitHub.



\### 5. Validate the connection



```bash

dbt debug

```



\### 6. Run dbt models



```bash

dbt run

```



\## Completed Work



\-  MovieLens dataset downloaded.

\-  CSV files uploaded to AWS S3.

\-  AWS S3 connected to Snowflake.

\-  Raw tables created in Snowflake.

\-  dbt project initialized.

\-  Snowflake connection configured and validated.

\-  Six staging views created.

\-  Three dimension tables created.

\-  One fact table created.

\-  Separate RAW and DEV schemas configured.

\-  Folder-level dbt materializations configured.

\-  Project pushed to GitHub.



\## Author



\*\*Reshma Karella\*\*



Master of Engineering Practice in Software Engineering  

Carleton University, Canada



GitHub: \[KarellaReshma560](https://github.com/KarellaReshma560)

