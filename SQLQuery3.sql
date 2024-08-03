use [Loan DB]
select * from loan_data
/*total loan application*/
select count(id) as Total_Loan_Applications from loan_data 
where month(issue_date)=11 and year(issue_date)=2021
--MTD-Pmtd/pmtd--Loan amount
select sum(loan_amount) as total_funded_amount from loan_data
select sum(loan_amount) as MTD_total_funded_amount from loan_data
where month(issue_date)=12 and year(issue_date)=2021
select sum(loan_amount) as PMTD_total_funded_amount from loan_data
where month(issue_date)=11 and year(issue_date)=2021
--Total amount received
select sum(total_payment) as total_amount_received from loan_data
select sum(total_payment) as MTD_total_amount_received from loan_data
where month(issue_date)=12 and year(issue_date)=2021
select sum(total_payment) as MTD_total_amount_received from loan_data
where month(issue_date)=11 and year(issue_date)=2021
--AVG interest rate
select round(avg(int_rate)*100,4) as avg_interest_rate from loan_data
select round(avg(int_rate),4)*100 as MTD_avg_interest_rate from loan_data
where month(issue_date)=11 and year(issue_date)=2021
select round(avg(int_rate),4)*100 as MTD_avg_interest_rate from loan_data
where month(issue_date)=12 and year(issue_date)=2021
--AVG DTI ratio
select avg(dti) as avg_dti from loan_data
select round(avg(dti),4)*100 as MTD_avg_dti from loan_data
where month(issue_date)=12 and year(issue_date)=2021
select round(avg(dti),4)*100 as PMTD_avg_dti from loan_data
where month(issue_date)=11 and year(issue_date)=2021
---Good Loan
select (count(
case when loan_status='Fully Paid' or loan_status='Current' then id end)*100)/count(id) 
as good_loan_percentage from loan_data
select count(id) as good_loan_applications from loan_data
where loan_status='Fully Paid' or loan_status='Current'
select sum(loan_amount) as good_loan_amount_funded from loan_data
where loan_status='Fully Paid' or loan_status='Current'
select sum(total_payment) as good_loan_amount_received from loan_data
where loan_status='Fully Paid' or loan_status='Current'
---Bad Loan
select 
(count(case when loan_status='Charged off' then id end)*100/count(id)) as bad_loan_percentage
from loan_data
select count(id) as bad_loan_applications from loan_data
where loan_status='Charged off'
select sum(loan_amount) as Bad_loan_amount from loan_data
where loan_status='Charged off'
select sum(total_payment) as Bad_loan_amount_received from loan_data
where loan_status='Charged off'
select loan_status,
		count(id) as loancount,
		sum(total_payment) as total_amount_received,
		sum(loan_amount) as total_funded_amount,
		avg(int_rate*100) as interest_rate,
		avg(dti*100) as dti
	from loan_data
	group by loan_status