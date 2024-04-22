# IDS Project: Bakery Information System

## Authors

- Daniel Onderka (xonder05)
- Maksim Kalutski (xkalut00)

## Project Overview

The goal of this project is to design a information system for a bakery. This system will manage information about different types of bakery products both from a production perspective (ingredients, costs, etc.) and a sales perspective (orders). The bakery manages its own delivery logistics with its fleet of vehicles, and customers can also opt for self-pickup.

## ERD and Use Case Model

- Entity-relationship model (ERD): Shows the relationships between the various data entities.
- Use Case Model: Outlines how different users interact with the system.

## Database Structure

The system uses several tables, including:

- `Bakery Products`, `Ingredients`, `Costs`, `Orders`, `Vehicles` for delivery.
- Additional tables like `Customer` and `Employee` to avoid redundancy.

## SQL Script

The SQL script contains:

- Table creation and data insertion.
- SQL queries to demonstrate the system's functionality.
- Triggers, procedures, and materialized views to enhance the system.
- Access rights and complex queries using `WITH` and `CASE`.
- Index creation and `EXPLAIN PLAN` to optimize query performance.
- Use of `CURSOR` and exception handling in procedures.