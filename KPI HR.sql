create database hranalytics;
use hranalytics;
select * from Hrd;

# ----------------------------- KPI 1 ---------------------------------------

# 1. Average Attrition rate for all Departments ----------------------------


select * from hrd;
select Department,count(attrition) `Number of Attrition`from hrd
where attrition = 'yes'
group by Department;


create view Dept_average as
select department, round(count(attrition)/(select count(employeenumber) from hrd)*100,2)  as attrtion_rate
from hrd
where attrition = "yes"
group by department;
select * from dept_average;


# ---------------------------------- KPI 2  --------------------------------------------

# 2. Average Hourly rate of Male Research Scientist


DELIMITER //
create procedure emp_role (in input_gender varchar(20), in input_jobrole varchar(30))
begin
 select Gender, round(avg(HourlyRate),2) `Avg Hourly Rate` from hrd
 where gender = input_gender and jobrole = input_jobrole
 group by gender;
end //
DELIMITER ;

call emp_role('male',"Research Scientist");


# ------------------------------ KPI 3 ----------------------------------------------


# 3. Attrition rate Vs Monthly income stats

select department,
round(count(attrition)/(select count(employeenumber) from hrd)*100,2) `Attrtion rate`,
round(avg(MonthlyIncome),2) average_income from hrd

where attrition = 'Yes'
group by department;


# ------------------------------------ KPI 4 ----------------------------------------------

# 4. Average working years for each Department

select department,Round(avg(totalworkingyears),2) from hrd

group by department;




# --------------------------------------------- KPI 5 --------------------------------------------

# 5. Job Role Vs Work life balance

select * from hrd;

select jobrole,worklifebalance_Reviews, count(worklifebalance_Reviews) Employee_count
from hrd
group by jobrole,worklifebalance_Reviews
order by jobrole;



# --------------------------------------------- KPI 6-------------------------------------------

# 6. Attrition rate Vs Year since last promotion relation

select * from  hrd;

select `PromotionYearGroup`,count(attrition)  attrition_count
from hrd
where attrition = 'Yes'
group by `PromotionYearGroup`
order by `PromotionYearGroup`;

