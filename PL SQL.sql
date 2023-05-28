-- Code1
--Max amount from bill table
set serveroutput on;
declare
 max_amount bill.amount%type;
begin
 select max(amount) into max_amount  from bill;
 dbms_output.put_line('The Maximum Amount is:' || max_amount);
end;
/

--Code2(cursor , %rowtype , %rowcount)
--select room_no and price for 1st 5 rows from room table
set serveroutput on;
declare
    cursor c1 is select room_no,price from room;
    room_record c1%rowtype;
begin
  open c1;
    loop
        fetch c1 into room_record;
        exit when c1%rowcount >5;
        dbms_output.put_line('Room Number:' || room_record.room_no|| ' ' ||'Price:'|| room_record.price);
    end loop;
  close c1;
end;
/


--Code3(procedure)
--finding bill_id for amount=5000 from bill table by procedure
set serveroutput on;
create or replace procedure getBillId is
 getamt bill.amount%type;
 Billing_id bill.bill_id%type;
begin
    getamt := 4000;
    select bill_id into Billing_id
    from bill where amount = getamt;
    dbms_output.put_line('bill ID  :  ' || Billing_id);
end;
/
begin
    getBillId;
end;
/

--Code4(Function)
--finding average amount from bill table by Function
set serveroutput on;
create or replace Function avg_amount return Number is
avg_amt bill.amount%type;
begin
     select AVG(amount) into avg_amt from bill;
     return avg_amt;
     dbms_output.put_line('Average Amount:' || avg_amount);
end;
/
--Calling function
set serveroutput on;
begin
 dbms_output.put_line('Average Amount:' || avg_amount);
 end;
/

 --Lab 9
 --Code5(Trigger)
 --update or insert room_status in room table using trigger

 create or replace trigger check_room_status before update or insert ON room for each row
 begin
 if :new.price = 1000 then 
 :new.room_status:= 'NonAC-Single';
 
 elsif :new.price = 1500 then 
 :new.room_status:= 'NonAC-Double';
 
 elsif :new.price = 2000 then 
 :new.room_status:= 'AC-Single';
 
 elsif :new.price = 3000 then 
 :new.room_status:= 'AC-Double';

 end if;
 end check_room_status;
 /
 show errors