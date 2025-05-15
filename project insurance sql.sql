use insurancep847;
select * from invoice;
/*1.. No of invoice by accaount execute
SELECT 
    `Account Executive`, `income_class`, COUNT(*) AS Invoice_Count
FROM invoice
GROUP BY `income_class`, `Account Executive`
ORDER BY `Account Executive` DESC;*/

/*2.. No of  meeting by Account Executive
select * from meeting;
select 'Account Executive',count(*) As meeting_count
From meeting
group by 'Account Executive'
order by meeting_count desc;*/


/* 2.1  count of year meeting*/
/*lect * from meeting;
SELECT year (meeting_date) as Meeting_Year, 
COUNT(meeting_date) as Meeting_Count
FROM meeting
GROUP BY year(meeting_date)
ORDER BY Meeting_Year;*/

/*3. target/ achivement/invoice/placed achievement%/invoice achievement%/cross sell/New/Renewal*/
/*CREATE DEFINER=`root`@`localhost` PROCEDURE `Data_by_Incomeclass`(IN Incomeclass varchar(30))
BEGIN
declare Budget_val int;
## Target,Invoice,Achieved for cross sell,New Renewal
set @Cross_sell_Target =(Select sum(Cross_sell_budget)from individual_budgets);
set @New_Target =(select sum(New_budget)from individual_budgets);
set @Renewal_Target =(select sum(Renewal_budget)from individual_budgets);


set@Invoice_val =(select sum(Amount) from invoice where	income_class = Incomeclass);
set@Achieved_val = ((select sum(Amount) from brokerage where income_class = Incomeclass)+
               (select sum(Amount) from fees where	income_class = Incomeclass));
  If Incomeclass ="Cross sell" then set Budget_val = @Cross_sell_Target;
  elseif Incomeclass ="New" then set Budget_val = @New_Target;
  elseif Incomeclass ="Renewal" then set Budget_val = @Renewal_Target;
  else set Budget_val =0;
  end if;
  
  ## Percentage for Placed AChievement For cross sell, new ,Renewal
  set@Placed_achievement = (select concat(format((@Achieved_val/Budget_val)*100,2), '%'));
  ## Percentage for Invoice AChievement For cross sell, new ,Renewal
     set@Invoice_achievement = (select concat(format((@Invoice_val/Budget_val)*100,2), '%')); 
 select IncomeClass, format(Budget_val,0) as Target, format(@Invoice_val,0) as Invoice,
 format(@Achieved_val,2) as Achieved, @Placed_achievement as Placed_Achivement_Percentage,
 @Invoice_achievement as Invoice_Achievement_Percentage;
 END*/
/*4..stage funnel by revenue
select * from opportunity;
SELECT 
    stage, 
    SUM(revenue_amount) AS Total_Revenue,
    COUNT(*) AS opportunity_Count
FROM opportunity
GROUP BY stage
ORDER BY Total_Revenue DESC; */


/* 5.. TOP -4 opportunity
SELECT opportunity_name, revenue_amount
FROM opportunity
ORDER BY revenue_amount DESC
LIMIT 4;*/

select * from opportunity;
/*..  top 4 open opportunity*/
/*select opportunity_name,revenue_amount
FROM opportunity
where stage in('Qualify Opportunity','Propose Solution')
ORDER BY revenue_amount DESC
limit 4;*/

/*7...oppty by Product distribution*/
/*select * from opportunity;
SELECT product_group, COUNT(*) AS opportunity_Count
FROM opportunity
GROUP BY product_group
ORDER BY opportunity_count DESC;*/

/*8..total Opportunity
select 'opportunity_name', count(*)as total_opp
from opportunity
group by 'opportunity_name'
order by 'total_opp';*/


/*9... total open Opportunity
select 'opportunity_name', count(*)as total_opp
from opportunity
where stage in('Qualify Opportunity','Propose Solution')
group by 'opportunity_name'
order by total_opp;

