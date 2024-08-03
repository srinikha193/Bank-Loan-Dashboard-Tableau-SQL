--analysing total loan applications,total funded amount,total amount received
use [Loan DB]
select * from loan_data
select 
		month(issue_date) as month_number,
		DATENAME(month, issue_date) as month_name,
		count(id) as total_loan_applications,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
	from loan_data
	group by datename(month, issue_date),month(issue_date)
	order by month(issue_date) 
select 
		address_state as state,
		count(id) as total_loan_applications,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
	from loan_data
	group by address_state
	order by address_state
select 
		term,
		count(id) as total_loan_applications,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
	from loan_data
	group by term
	order by term
select 
		emp_length,
		count(id) as total_loan_applications,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
	from loan_data
	group by emp_length
	order by emp_length
select 
		purpose,
		count(id) as total_loan_applications,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
	from loan_data
	group by purpose
	order by count(id) desc
select 
		home_ownership,
		count(id) as total_loan_applications,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
	from loan_data
	group by home_ownership
	order by count(id)
---applying filters and observing the trends
select 
		home_ownership,
		count(id) as total_loan_applications,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
	from loan_data
	where grade='A' and address_state='IL'
	group by home_ownership
	order by count(id)
