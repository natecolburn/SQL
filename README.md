# SQL

This repository contains a collection of SQL queries built from a sample insurance-based dataset. Each query demonstrates common data analysis techniques used in real-world scenarios.

---

### 📂 Find-accounts-with-more-than-one-plan.sql

**Description:**  
Returns a list of accounts that are associated with more than one plan. Useful for identifying clients with multiple policy relationships.

========================================================================================================================

### 📂 plan-splits-insert-update-delete.sql

**Description:**  
This SQL file includes examples of how to manage data within the `nyins.PlanSplits` table. It covers inserting new rows, updating existing values, deleting specific records, and handling ordering issues when the primary key is stored as a `VARCHAR`. Each example uses `BEGIN TRAN` so changes can be tested safely before committing.

**Included Queries:**
- **Order by numeric value (when SplitId is a VARCHAR)**
- **Delete a specific PlanSplit row**
- **Update a PlanSplit percentage**
- **Insert a new PlanSplit record**
