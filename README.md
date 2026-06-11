# logistics-sql

SQL portfolio project — logistics and cargo data analysis

## Project Overview
This project simulates a real-world logistics operation database.
It covers shipment tracking, driver performance, route analysis, and client reporting.

## Database Schema
- **klienci** — clients (companies and individuals)
- **firmy** — transport companies
- **kierowcy** — drivers assigned to companies
- **trasy** — routes with distance
- **przesylki** — shipments linking all entities

## Analysis Queries
1. Top drivers by number of shipments
2. Average delivery time per transport company
3. Most used routes
4. Top clients by total weight
5. Shipment status breakdown with percentages
6. Drivers with delayed deliveries
7. Driver ranking by total weight (window function)

## Tech Stack
- PostgreSQL
- Pure SQL (DDL, DML, aggregations, JOINs, CTEs, window functions)
