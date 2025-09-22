-- Table relationnelle classique
BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS traces (
    id INTEGER,
    loc TEXT,
    machine_code TEXT,
    product_task_id INTEGER,
    counter_ref INTEGER,
    counter INTEGER,
    status TEXT,
    dt_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    session_id TEXT,
    archive TEXT
);

CREATE TABLE IF NOT EXISTS comments (
    code TEXT,
    type_comments TEXT,
    comments TEXT
);

CREATE TABLE IF NOT EXISTS adam_monitor (
    id SERIAL PRIMARY KEY,
    machine_number TEXT,
    counter INTEGER,
    online BOOLEAN,
    Status TEXT,
    old_counter INTEGER,
    new_counter INTEGER,
    qty INTEGER,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_date TEXT,
    new_date TEXT,
    time_calc INTEGER
);

CREATE TABLE machines_status_evts_ERK(
    Session TEXT,
    machine_number TEXT,
    product_order_number TEXT,
    task_number TEXT,
    operator_code TEXT,
    SPI_setup_qty INT,
    SPI_maculature_qty INT,
    SPI_good_qty INT,
    SPI_waste_qty INT,
    SPI_time_setup REAL,
    SPI_time_run REAL,
    SPI_dt_setup_ref TEXT,
    SPI_dt_run_ref TEXT,
    Adam_status INT,
    Adam_last_sync TEXT,
    Adam_counter INT,
    speed INT,
    Machine_status INT,
    dt_crea TEXT,
    dt_upd TEXT,
    product_task_code TEXT,
    SPI_qty_ref INT,
    SPI_dt_ref TEXT,
    SPI_Downtime_qty INT,
    SPI_time_Downtime REAL,
    loc TEXT,
    FPS TEXT,
    FPS_Valid TEXT,
    SPI_evt TEXT,
    id INT,
    ERK_sync_at TEXT,
    Shift TEXT,
    Shift_validation TEXT,
    output1 INT,
    output2 INT
);

CREATE TABLE Machines_status (
    Session TEXT,
    machine_number TEXT,
    product_order_number TEXT,
    task_number TEXT,
    operator_code TEXT,
    SPI_dt_ref TEXT,
    SPI_setup_qty INTEGER DEFAULT 0,
    SPI_maculature_qty INTEGER DEFAULT 0,
    SPI_good_qty INTEGER DEFAULT 0,
    SPI_waste_qty INTEGER DEFAULT 0,
    SPI_time_setup REAL DEFAULT 0,
    SPI_time_run REAL DEFAULT 0,
    SPI_dt_setup_ref TEXT,
    SPI_dt_run_ref TEXT,
    Adam_status TEXT,
    Adam_last_sync TEXT,
    Adam_counter INTEGER DEFAULT 0,
    speed INTEGER DEFAULT 0,
    Machine_status TEXT,
    dt_crea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_upd TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    product_task_code TEXT,
    SPI_qty_ref INTEGER DEFAULT 0,
    SPI_Downtime_qty INTEGER DEFAULT 0,
    SPI_time_Downtime REAL DEFAULT 0,
    loc TEXT,
    FPS TEXT,
    FPS_valid TEXT DEFAULT 'No',
    SPI_evt TEXT,
    Shift TEXT,
    Shift_validation TEXT,
    output1 INTEGER DEFAULT 0,
    output2 INTEGER DEFAULT 0,
    po_task_ref TEXT,
    Plate_clean INTEGER DEFAULT 0,
    Plate_chg INTEGER DEFAULT 0,
    Varnish_clean INTEGER DEFAULT 0,
    Varnish_chg INTEGER DEFAULT 0,
    traces TEXT,
    func TEXT,
    PLATE_CHG_TRC TEXT,
    CLEAN_CHG_TRC TEXT,
    GOOD_QTY_PLAN INTEGER DEFAULT 0,
    WASTE_QTY_PLAN INTEGER DEFAULT 0,
    SETUP_QTY_PLAN INTEGER DEFAULT 0,
    OUTPUT1_PLAN INTEGER DEFAULT 0,
    OUTPUT2_PLAN INTEGER DEFAULT 0,
    GROUPS TEXT,
    TIME_SETUP_PLAN REAL DEFAULT 0,
    TIME_DOWNTIME_PLAN REAL DEFAULT 0,
    TIME_RUN_PLAN REAL DEFAULT 0,
    Plate_chg_plan INTEGER,
    Varnish_chg_plan INTEGER
);

CREATE TABLE Machines_status_evts (
    Session TEXT,
    machine_number TEXT,
    product_order_number TEXT,
    task_number TEXT,
    operator_code TEXT,
    SPI_setup_qty INTEGER DEFAULT 0,
    SPI_maculature_qty INTEGER DEFAULT 0,
    SPI_good_qty INTEGER DEFAULT 0,
    SPI_waste_qty INTEGER DEFAULT 0,
    SPI_time_setup REAL DEFAULT 0,
    SPI_time_run REAL DEFAULT 0,
    SPI_dt_setup_ref TEXT,
    SPI_dt_run_ref TEXT,
    Adam_status TEXT,
    Adam_last_sync TEXT,
    Adam_counter INTEGER DEFAULT 0,
    speed INTEGER DEFAULT 0,
    Machine_status INTEGER DEFAULT 0,
    dt_crea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_upd TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    product_task_code TEXT,
    SPI_qty_ref INTEGER DEFAULT 0,
    SPI_dt_ref TEXT,
    SPI_Downtime_qty INTEGER DEFAULT 0,
    SPI_time_Downtime REAL DEFAULT 0,
    loc TEXT,
    FPS TEXT,
    FPS_Valid TEXT DEFAULT 'No',
    SPI_evt TEXT,
    id SERIAL PRIMARY KEY,
    ERK_sync_at TEXT DEFAULT '',
    Shift TEXT,
    Shift_validation TEXT,
    output1 INTEGER DEFAULT 0,
    output2 INTEGER DEFAULT 0,
    po_task_ref TEXT,
    Plate_clean INTEGER DEFAULT 0,
    Plate_chg INTEGER DEFAULT 0,
    Varnish_clean INTEGER DEFAULT 0,
    Varnish_chg INTEGER DEFAULT 0,
    traces TEXT,
    func TEXT,
    PLATE_CHG_TRC TEXT,
    CLEAN_CHG_TRC TEXT,
    GOOD_QTY_PLAN INTEGER DEFAULT 0,
    WASTE_QTY_PLAN INTEGER DEFAULT 0,
    SETUP_QTY_PLAN INTEGER DEFAULT 0,
    OUTPUT1_PLAN INTEGER DEFAULT 0,
    OUTPUT2_PLAN INTEGER DEFAULT 0,
    GROUPS TEXT,
    TIME_SETUP_PLAN REAL DEFAULT 0,
    TIME_DOWNTIME_PLAN REAL DEFAULT 0,
    TIME_RUN_PLAN REAL DEFAULT 0,
    Plate_chg_plan INTEGER,
    Varnish_chg_plan INTEGER
);

CREATE INDEX IF NOT EXISTS macih ON Machines_status_evts (machine_number);
CREATE INDEX IF NOT EXISTS "ope  shift mach" ON Machines_status_evts (operator_code, Shift, machine_number);
CREATE INDEX IF NOT EXISTS shift_idx ON Machines_status_evts (Shift);


CREATE TABLE IF NOT EXISTS operators (
    code TEXT,
    descr TEXT,
    dtc8 INTEGER,
    dma8 INTEGER,
    active INTEGER,
    last_sync INTEGER,
    sector TEXT
);

CREATE TABLE IF NOT EXISTS traces (
    id INTEGER,
    loc TEXT,
    machine_code TEXT,
    product_task_id INTEGER,
    counter_ref INTEGER,
    counter INTEGER,
    status TEXT,
    dt_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    session_id TEXT,
    archive TEXT
);

CREATE TABLE IF NOT EXISTS tmp_operators (
    code TEXT,
    descr TEXT,
    dtc8 INTEGER,
    dma8 INTEGER,
    active INTEGER,
    last_sync INTEGER,
    sector TEXT
);

CREATE TABLE IF NOT EXISTS dowtime_codes (
    code TEXT,
    descr TEXT,
    active INTEGER,
    last_sync TEXT,
    category01 TEXT,
    category02 TEXT,
    code_erk TEXT,
    apply_on TEXT
);

CREATE TABLE IF NOT EXISTS tmp_dowtime_codes (
    code TEXT,
    descr TEXT,
    active INTEGER,
    last_sync TEXT,
    category01 TEXT,
    category02 TEXT,
    code_erk TEXT,
    apply_on TEXT
);

CREATE TABLE IF NOT EXISTS machines (
    code TEXT,
    descr TEXT,
    adam_ip TEXT,
    loc TEXT,
    dtc8 NUMERIC,
    dma8 NUMERIC,
    last_sync NUMERIC,
    mm_code TEXT,
    adam_status INTEGER,
    group_res TEXT,
    sector TEXT,
    spec_grp TEXT
);

CREATE TABLE IF NOT EXISTS tmp_machines (
    code TEXT,
    descr TEXT,
    adam_ip TEXT,
    loc TEXT,
    dtc8 NUMERIC,
    dma8 NUMERIC,
    last_sync NUMERIC,
    mm_code TEXT,
    adam_status INTEGER,
    group_res TEXT,
    sector TEXT,
    spec_grp TEXT
);

CREATE TABLE IF NOT EXISTS tmp_product_tasks (
    code TEXT,
    product_order_number TEXT,
    task_number TEXT,
    machine_number TEXT,
    task_code TEXT,
    dt_start_plan NUMERIC DEFAULT 0,
    dt_end_plan INTEGER DEFAULT 0,
    machine_group TEXT,
    product_order_status TEXT,
    task_unity_plan TEXT,
    task_coef INTEGER DEFAULT 1,
    task_qty_plan INTEGER DEFAULT 0,
    task_qty_plan_final_unit INTEGER DEFAULT 0,
    task_time_setup_plan REAL DEFAULT 0,
    task_time_run_plan REAL DEFAULT 0,
    product_order_type INTEGER,
    waste_qty_plan INTEGER DEFAULT 0,
    sector TEXT,
    loc TEXT,
    last_sync INTEGER,
    product_order_descr TEXT,
    task_code_descr TEXT,
    spi_setup_qty INTEGER DEFAULT 0,
    spi_good_qty INTEGER DEFAULT 0,
    spi_maculature INTEGER DEFAULT 0,
    spi_waste_qty INTEGER DEFAULT 0,
    spi_time_setup REAL DEFAULT 0,
    spi_time_run REAL DEFAULT 0,
    ordered TEXT,
    setup_qty_plan INTEGER DEFAULT 0,
    groups TEXT,
    status TEXT,
    output1_plan INTEGER DEFAULT 0,
    output2_plan INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS product_tasks (
    code TEXT,
    product_order_number TEXT,
    task_number TEXT,
    machine_number TEXT,
    task_code TEXT,
    dt_start_plan NUMERIC DEFAULT 0,
    dt_end_plan NUMERIC DEFAULT 0,
    machine_group TEXT,
    product_order_status TEXT,
    task_unity_plan TEXT,
    task_coef INTEGER DEFAULT 1,
    task_qty_plan INTEGER DEFAULT 0,
    task_qty_plan_final_unit INTEGER DEFAULT 0,
    task_time_setup_plan REAL DEFAULT 0,
    task_time_run_plan REAL DEFAULT 0,
    product_order_type INTEGER,
    waste_qty_plan INTEGER DEFAULT 0,
    sector TEXT,
    loc TEXT,
    last_sync INTEGER,
    machine_status TEXT,
    product_order_descr TEXT,
    task_code_descr TEXT,
    spi_setup_qty INTEGER DEFAULT 0,
    spi_good_qty INTEGER DEFAULT 0,
    spi_maculature INTEGER DEFAULT 0,
    spi_waste_qty INTEGER DEFAULT 0,
    spi_time_setup REAL DEFAULT 0,
    spi_time_run REAL DEFAULT 0,
    ordered TEXT,
    setup_qty_plan INTEGER DEFAULT 0,
    groups TEXT,
    status TEXT,
    output1_plan INTEGER DEFAULT 0,
    output2_plan INTEGER DEFAULT 0
);

COMMIT;

-- Table destinée aux séries temporelles
CREATE TABLE IF NOT EXISTS public.metrics (
    time TIMESTAMPTZ NOT NULL,
    device_id INTEGER NOT NULL,
    temperature DOUBLE PRECISION,
    humidity DOUBLE PRECISION
);

-- Conversion en hypertable TimescaleDB
SELECT create_hypertable('metrics', 'time', if_not_exists => TRUE);
