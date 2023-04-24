CREATE DATABASE IF NOT EXISTS yfinance;
USE yfinance;
DROP TABLE IF EXISTS params;
CREATE TABLE params (
    id INT AUTO_INCREMENT PRIMARY KEY,
    api_name VARCHAR(20) NOT NULL,
    param_name VARCHAR(20) NOT NULL,
    param_value VARCHAR(10) NOT NULL,
    UNIQUE(api_name, param_name)
);

INSERT INTO params (api_name, param_name, param_value) VALUES ('history', 'period', '1y');
INSERT INTO params (api_name, param_name, param_value) VALUES ('history', 'interval', '1d');
INSERT INTO params (api_name, param_name, param_value) VALUES ('get_shares_full', 'start', "2022-01-01");

DROP TABLE IF EXISTS ticker;
CREATE TABLE ticker (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(10) NOT NULL UNIQUE
);

INSERT INTO ticker (name) VALUES 
('AAPL'),
('MSFT'),
('GOOG'),
('AMZN'),
('BRK-A'),
('NVDA'),
('TSLA'),
('META'),
('UNH'),
('XOM'),
('V'),
('JNJ'),
('WMT'),
('JPM'),
('PG'),
('LLY'),
('MA'),
('CVX'),
('HD'),
('MRK'),
('ABBV'),
('KO'),
('AVGO'),
('ORCL'),
('PEP'),
('PFE'),
('BAC'),
('TMO'),
('COST'),
('CSCO'),
('MCD'),
('CRM'),
('ACN'),
('NKE'),
('DIS'),
('ABT'),
('DHR'),
('LIN'),
('ADBE'),
('VZ'),
('TXN'),
('UPS'),
('NEE'),
('CMCSA'),
('PM'),
('NFLX'),
('AMD'),
('BMY'),
('WFC'),
('MS'),
('BBBY'),
('AMC'),
('GME'),
('BB');

CREATE TABLE IF NOT EXISTS info (
  symbol VARCHAR(10) NOT NULL UNIQUE,
  currency VARCHAR(10) NOT NULL,
  day_high DOUBLE(12,4) NOT NULL,
  day_low DOUBLE(12,4) NOT NULL,
  exchange VARCHAR(15) NOT NULL,
  fifty_day_average DOUBLE(12,4),
  last_price DOUBLE(12,4),
  last_volume BIGINT NOT NULL,
  market_cap BIGINT NOT NULL,
  day_open DOUBLE(12,4) NOT NULL,
  pre_close DOUBLE(12,4) NOT NULL,
  quote_type VARCHAR(20) NOT NULL,
  reg_pre_close DOUBLE(12,4) NOT NULL,
  num_shares BIGINT NOT NULL,
  ten_day_aver_vol BIGINT NOT NULL,
  three_month_aver_vol BIGINT NOT NULL,
  timezone VARCHAR(50) NOT NULL,
  two_hundred_day_aver DOUBLE NOT NULL,
  year_change DOUBLE NOT NULL,
  year_high DOUBLE(12,4) NOT NULL,
  year_low DOUBLE(12,4) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS hist_price (
    id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    datetime DATETIME NOT NULL,
    open_price DOUBLE(12,4) NOT NULL,
    high_price DOUBLE(12,4) NOT NULL,
    low_price DOUBLE(12,4) NOT NULL,
    close_price DOUBLE(12,4) NOT NULL,
    volume BIGINT NOT NULL,
    time_range VARCHAR(5) NOT NULL,
    data_granularity VARCHAR(5) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (symbol, datetime, time_range, data_granularity)
);

CREATE TABLE IF NOT EXISTS hist_meta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    currency VARCHAR(6) NOT NULL,
    symbol VARCHAR(10) NOT NULL,
    exchange_name VARCHAR(8) NOT NULL,
    instrument_type VARCHAR(15) NOT NULL,
    first_trade_date DATETIME NOT NULL,
    regular_market_time DATETIME NOT NULL,
    gmt_offset INT NOT NULL,
    timezone VARCHAR(6) NOT NULL,
    exchange_tz_name VARCHAR(30) NOT NULL,
    reg_market_price DOUBLE(12,4) NOT NULL,
    chart_prev_close DOUBLE(12,4) NOT NULL,
    price_hint TINYINT NOT NULL,
    data_granularity VARCHAR(4) NOT NULL,
    time_range VARCHAR(4) NOT NULL,
    curr_pre_market_start DATETIME NOT NULL,
    curr_pre_market_end DATETIME NOT NULL,
    curr_reg_market_start DATETIME NOT NULL,
    curr_reg_market_end DATETIME NOT NULL,
    curr_post_market_start DATETIME NOT NULL,
    curr_post_market_end DATETIME NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (symbol, time_range)
);

CREATE TABLE IF NOT EXISTS earnings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    earnings_date DATETIME NOT NULL,
    eps_estimate FLOAT,
    reported_eps FLOAT,
    surprise_pct DOUBLE(7,4),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (symbol, earnings_date)
);

CREATE TABLE IF NOT EXISTS major_holders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    insider_hold_pct VARCHAR(8) NOT NULL,
    inst_hold_pct VARCHAR(8) NOT NULL,
    float_hold_pct VARCHAR(8) NOT NULL,
    num_inst INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(symbol, insider_hold_pct, inst_hold_pct, float_hold_pct, num_inst)
);

CREATE TABLE IF NOT EXISTS inst_holders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    holders VARCHAR(100) NOT NULL,
    shares BIGINT NOT NULL,
    date_reported DATE NOT NULL,
    pct_out DOUBLE(8,4) NOT NULL,
    shares_val BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE(symbol, holders, date_reported)
);

CREATE TABLE IF NOT EXISTS mtlfd_holders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    holders VARCHAR(100) NOT NULL,
    shares BIGINT NOT NULL,
    date_reported DATE NOT NULL,
    pct_out DOUBLE(8,4) NOT NULL,
    shares_val BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE(symbol, holders, date_reported)
);

CREATE TABLE IF NOT EXISTS news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    uuid CHAR(36) NOT NULL UNIQUE,
    title VARCHAR(255) NOT NULL,
    publisher VARCHAR(60) NOT NULL,
    link VARCHAR(170) NOT NULL,
    publish_time DATETIME NOT NULL,
    news_type VARCHAR(20) NOT NULL,
    thumbnail JSON,
    related_tickers JSON,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS share_count (
    id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    record_date DATE NOT NULL,
    share_count BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (symbol, record_date)
);

CREATE TABLE IF NOT EXISTS actions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    action_date DATE NOT NULL,
    dividends DOUBLE NOT NULL,
    stock_splits DOUBLE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (symbol, action_date)
);
