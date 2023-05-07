-- Solution to Capture1
SELECT 
	CASE
		WHEN MONTH(invoice_date) <= 6 THEN 'First half of 2019'
        ELSE 'Second half of 2019'
	END as 'data range',
    SUM(invoice_total) as 'total sales',
    SUM(payment_total) as 'total payment',
    SUM(invoice_total - payment_total) as 'what we expect'
FROM invoices
WHERE YEAR(invoice_date) = '2019'
GROUP BY 1;