-- Table relationnelle classique
CREATE TABLE IF NOT EXISTS public.users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Table destinée aux séries temporelles
CREATE TABLE IF NOT EXISTS public.metrics (
    time TIMESTAMPTZ NOT NULL,
    device_id INTEGER NOT NULL,
    temperature DOUBLE PRECISION,
    humidity DOUBLE PRECISION
);

-- Conversion en hypertable TimescaleDB
SELECT create_hypertable('metrics', 'time', if_not_exists => TRUE);
