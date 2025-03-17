# Github_Free_SQL_questions

**1068. Product Sales Analysis I**
      select product_name,year,price
      from Sales
      left join Product on Sales.product_id =Product.product_id

**1527. Patients With a Condition**
      select *
      from Patients
      where conditions like '% DIAB1%' OR conditions like 'DIAB1%'
**1075. Project Employees I**
      select p.project_id,round(avg(1.0*e.experience_years),2) as average_years 
      from Project p
      left join Employee e on e.employee_id = p.employee_id 
      group by  p.project_id
