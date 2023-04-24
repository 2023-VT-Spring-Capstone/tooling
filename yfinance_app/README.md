# Introduction

When the container is running, the Python schedule (scheduler.py) is constantly scraping data by calling the other API files at different times.

# Instruction

If you need to immediately run a specific API file, follow these instructions.

### Step 1:
```
docker exec -it yfinance-data-scraper bash
```
Access into the bash of the container.

### Step 2:
```
ls
```
To see what API files are available in the container.
API files: info.py, history.py, holders.py. earnings.py, share_count.py, news.py, ~~actions.py~~(doesn't work as of now)

### Step 3:
```
python <chosen_file>.py
```
Execute the API python file to immediately scrape specific data from Yahoo finance.