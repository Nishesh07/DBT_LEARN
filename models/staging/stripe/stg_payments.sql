with payment as(
SELECT ID as PAYMENT_ID,
ORDERID as ORDER_ID, 
PAYMENTMETHOD, 
STATUS, 
AMOUNT/100 AS AMOUNT,
created as created_at
 FROM RAW.STRIPE.PAYMENT
)

SELECT * FROM PAYMENT