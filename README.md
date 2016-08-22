# twino_HW
Required Postgresql DB. I used version 9.5.4.

Create DB user twino with a password twino.
Create database twino.
Run DB script "dbScripts/twino.sql" to create structure and some data.

If something is different, change db.properties.
To change requests per sec, change loans.properies.

## How to call
List all applications:
http://localhost:8080/listLoans?personalID=

List user applications:
http://localhost:8080/listLoans?personalID=111111-11111

Apply for loan:
http://localhost:8080/applyForLoan?name=J%C4%81nis&surname=B%C4%93rzi%C5%86%C5%A1&personalID=111111-11111&amount=1234.50&term=12

Add test data:
http://127.0.0.1:8080/addTest

Returned data:
{"id":119,"amount":0.0,"term":12,"name":"TestName","surname":"TestSurname","personalID":"111111-11111","applicationDate":1471888339669,"approved":true,"country":"LV"}



