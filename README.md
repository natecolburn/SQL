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

========================================================================================================================

## 📂 plan_splits_with_house_account.sql

This script ensures every plan in `PlanSplits` includes a "HOUSE" account (EmployeeId 16) so that all splits total exactly 100%.

We remove existing HOUSE rows first because not all of them are correct — some don't fill the full gap to 100%. Then we calculate the true remainder per plan and re-add HOUSE with the correct value.

---

### What It Does
- Removes current HOUSE rows.
- Sums remaining splits per plan.
- Re-adds HOUSE:
  - If splits exist → fills the gap.
  - If no splits → HOUSE gets 100%.
- Returns all splits, now totaling 100% per plan.

---

### Key CTEs
- `RemoveHouse`: Excludes existing HOUSE rows.
- `HouseInsert`: Adds correct HOUSE entry per plan.

---

### Output
PlanId, PlanName, EmployeeId, FirstName, LastName, SplitPercentage, EffectiveDate
