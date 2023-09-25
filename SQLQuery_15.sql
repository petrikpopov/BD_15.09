Select Student.first_name as Name , Student.last_name as last
from S_Cards inner join Student on S_Cards.id_student = Student.id
Where S_Cards.date_in is null 

-------------------------------

Select Student.first_name as name 
from Student
Left join S_Cards on S_Cards.id_student = Student.id
Where S_Cards.id_student is null

-------------------------------

SELECT TOP 1 Librarian.first_name ,Librarian.last_name, COUNT(*) AS counter_lib
FROM
(
    SELECT * FROM S_Cards
    UNION ALL
    SELECT * FROM T_Cards
) AS Book
JOIN Librarian on Book.id_librarian = Librarian.id
GROUP BY
    Librarian.first_name, Librarian.last_name
ORDER BY
    counter_lib DESC

-------------------------------

select top 1 Librarian.first_name , Librarian.last_name , count(1) as counter_l
from (
 select * from S_Cards where date_in is not null
 union all
 select * from T_Cards where date_in is not null
 
)as b
Join Librarian on b.id_librarian = Librarian.id
group by Librarian.first_name,Librarian.last_name
order by counter_l Desc
