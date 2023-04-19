# Introduction

When the container is running, the Spring Boot backend application is running on port 80.

You can use the following API endpoints to interact with the application.

1. http://localhost/stock/AAPL

    This endpoint provides stock data of AAPL from every MySQL table.

2. http://localhost/stock/AAPL/info

    This endpoint provides specific stock data of AAPL from MySQL tables including 'info', 'hist_meta', 'earnings'.

3. http://localhost/stock/AAPL/chart

    This endpoint provides history close price and date data of AAPL from the hist_price MySQL table.

4. http://localhost/detailByItem?date=2023-04-18

    This endpoint provides analysis and Reddit post data of the specified date from Elasticsearch.

