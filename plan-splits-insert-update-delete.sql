/***Description:**  
This SQL file includes examples of how to manage data within the `nyins.PlanSplits` table. It covers inserting new rows, updating existing values, deleting specific records, and handling ordering issues when the primary key is stored as a `VARCHAR`. Each example uses `BEGIN TRAN` so changes can be tested safely before committing.

**Included Queries:**
- **Order by numeric value (when SplitId is a VARCHAR)**
- **Delete a specific PlanSplit row**
- **Update a PlanSplit percentage**
- **Insert a new PlanSplit record***/

/*Note: Run each query one section at a time.
  Use BEGIN TRAN to preview the changes before committing them.
  If the table looks correct, go ahead and COMMIT.
  If something doesn’t look right, you can ROLLBACK to restore the table to its original state.
*/

-- ordering by split Id when the value is a varchar 
select * from nyins.PlanSplits
Order By CAST(SplitId AS INT);


-- Removes a row from PlanSplits
Begin Tran 
Delete FROM nyins.PlanSplits 
Where EmployeeId = '16' and PlanId = '1'
--Commit
--RollBack

--Updates a field in PlanSplits
Begin Tran 
Update nyins.PlanSplits 
Set SplitPercentage = '12'
Where EmployeeId = '16' and PlanId = '10'
--Commit
--RollBack

--Adds a record on PlanSplits
Begin Tran;
Insert into nyins.PlanSplits 
(SplitId,PlanId,EmployeeId, SplitPercentage, EffectiveDate)
VALUES('189', '42', '2', '10.5', '2025-07-14');
--Commit
--RollBack

