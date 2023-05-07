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

-- Solution to Capture2
SELECT p.date, p_m.name as payment_method, SUM(p.amount) as total_payments
FROM payments p
JOIN payment_methods p_m ON p.payment_method = p_m.payment_method_id
GROUP BY date, payment_method
ORDER BY date;
