-- project DB Script 
--# �ۼ�/�˼��� : �ڼ���, ������, ��â��, ����� 
--# ��û ���̺� : �л����̺�, �������̺�, �а����̺�, �������̺�, ������û ���̺�(�� �л���)
--# �����)
--    1. ���ڿ��� ���� varchar2(150)���� ����(�ѱ۷� ���� ������ ũ�� ���). ���ڵ����ʹ� number���� ����.
--    2. �Է� �ʼ� �����ʹ� not null�� ����.
--    3. �������̺��� �а���ȣ�� ���� null ����� �а��� �������� ���� ������ �����ϴ� ��� ���.
--    4. Ʈ����� �� commit ó��.
--    5. �ʿ信 ���� FK ���� (����� �������� - ����, ���� ���� ���).
--    6. �а���ȣ(1 : ��ǻ�Ͱ��а�), ������ȣ(100~), �����ȣ(10~), �й�(xxxxxxxxx) ���� ����.
--    7. ���ʵ����Ͷ� ���ν��� ������ ��ġ�� �ʰ� ���Ƿ� ���� �����͸� �ǹ�.
--    8. ��Ű���� ������� �ʴ´�.
-------------------------------------------
--# �л����̺�
create table student(
  stu_id varchar2(150) not null,
  stu_name varchar2(150),
  stu_password varchar2(150),
  stu_birth varchar2(20),
  stu_number number not null,
  stu_address varchar2(150),
  stu_deptno number not null,
  stu_grade number,
  stu_email varchar2(150),
  stu_phonenumber varchar2(150),
  stu_photo varchar2(150),
  primary key(stu_number)
);

desc student;
select * from student;

drop table student;
delete from student;

commit;
-- $ ���ʵ����� ����
insert into student(stu_id, stu_name, stu_password, stu_birth, stu_number, stu_address, stu_deptno, stu_grade,stu_email, stu_phonenumber, stu_photo) 
values('scw0531', '��â��','tjckd246!','92/04/06',201158102,'��⵵ ������',1,4,'scw05313315@gmail.com','01042084757','seopicture.png');

commit;
-------------------------------------------
--# �������̺�
create table professor(
  pro_name varchar2(150),
  pro_number number not null,
  pro_phonenumber varchar2(150),
  pro_id varchar2(150) not null,
  pro_password varchar2(150),
  pro_address varchar2(150),
  pro_deptno number,
  pro_email varchar2(150),
  primary key(pro_number)
);

desc professor;
select * from professor;

drop table professor;
delete from professor;

commit;
-- $ ���ʵ����� ����
insert into professor(pro_name, pro_number, pro_phonenumber, pro_id, pro_password, pro_address, pro_deptno, pro_email)
values('ȫ�浿', 100, '01011112222', 'pro123', 'pro123', '����Ư���� ������', 1, 'pro123@gmail.com');
insert into professor(pro_name, pro_number, pro_phonenumber, pro_id, pro_password, pro_address, pro_deptno, pro_email)
values('�Ӳ���', 101, '01022223333', 'pro456', 'pro456', '����Ư���� ���α�', 1, 'pro456@gmail.com');
insert into professor(pro_name, pro_number, pro_phonenumber, pro_id, pro_password, pro_address, pro_deptno, pro_email)
values('��ö��', 102, '01044445555', 'pro789', 'pro789', '����Ư���� ��õ��', 1, 'pro789@gmail.com');
insert into professor(pro_name, pro_number, pro_phonenumber, pro_id, pro_password, pro_address, pro_deptno, pro_email)
values('�迵��', 103, '01066667777', 'pro987', 'pro987', '����Ư���� ������', 1, 'pro987@gmail.com');
insert into professor(pro_name, pro_number, pro_phonenumber, pro_id, pro_password, pro_address, pro_deptno, pro_email)
values('��ö��', 104, '01088889999', 'pro654', 'pro654', '����Ư���� ���ϱ�', 1, 'pro654@gmail.com');
insert into professor(pro_name, pro_number, pro_phonenumber, pro_id, pro_password, pro_address, pro_deptno, pro_email)
values('������', 105, '01012121212', 'pro432', 'pro432', '����Ư���� ������', 1, 'pro432@gmail.com');
insert into professor(pro_name, pro_number, pro_phonenumber, pro_id, pro_password, pro_address, pro_deptno, pro_email)
values('��ö��', 106, '01023232323', 'pro111', 'pro111', '����Ư���� �߱�', 1, 'pro111@gmail.com');
commit;
-------------------------------------------
--# �а����̺�
create table department(
  dept_no number,
  dept_name varchar2(150) not null,
  primary key(dept_no)
);

desc department;
select * from department;

drop table department;

commit;
-- $ ���ʵ����� ����
insert into department(dept_no, dept_name) values(1, '��ǻ�Ͱ��а�');
insert into department(dept_no, dept_name) values(2, '�濵�а�');

commit;
-------------------------------------------
--# �������̺�
create table course(
  c_number number,
  c_name varchar2(150),
  c_date_time varchar2(150),
  c_grade number,
  pro_number number,
  dept_no number,
  primary key(c_number, c_date_time) 
);

desc course;
select * from course;

drop table course;
delete from course;

commit;
-- $ ���ʵ����� ����
-- *1 course
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(10, 'Introduction to Computer Engineering', 3, 'Mon|1',100, 1);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(10, 'Introduction to Computer Engineering', 3, 'Mon|2',100);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(10, 'Introduction to Computer Engineering', 3, 'Wed|3',100);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(10, 'Introduction to Computer Engineering', 3, 'Wed|4',100);
-- *2 course
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(11, 'Database', 3, 'Mon|3',101);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(11, 'Database', 3, 'Mon|4',101);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(11, 'Database', 3, 'Wed|1',101);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(11, 'Database', 3, 'Wed|2',101);
-- *3 course
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(12, 'algorithm', 3, 'Tue|1',102);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(12, 'algorithm', 3, 'Tue|2',102);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(12, 'algorithm', 3, 'Thu|3',102);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(12, 'algorithm', 3, 'Thu|4',102);
-- *4 course
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(13, 'Java programming', 3, 'Tue|3',103);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(13, 'Java programming', 3, 'Tue|4',103);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(13, 'Java programming', 3, 'Thu|1',103);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(13, 'Java programming', 3, 'Thu|2',103);
-- *5 course
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(14, 'Artificial intelligence', 3, 'Mon|1',104);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(14, 'Artificial intelligence', 3, 'Mon|2',104);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(14, 'Artificial intelligence', 3, 'Mon|3',104);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(14, 'Artificial intelligence', 3, 'Mon|4',104);
-- *6 course
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(15, 'Web Programming', 3, 'Thu|1',105);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(15, 'Web Programming', 3, 'Thu|2',105);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(15, 'Web Programming', 3, 'Thu|3',105);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(15, 'Web Programming', 3, 'Thu|4',105);
-- *7 course
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(16, 'Logic circuit', 3, 'Mon|7',106);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(16, 'Logic circuit', 3, 'Mon|8',106);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(16, 'Logic circuit', 3, 'Mon|9',106);
insert into course(c_number, c_name, c_grade, c_date_time, pro_number) values(16, 'Logic circuit', 3, 'Mon|10',106);

commit;

-- print course list
SELECT c_number, c_name, c_grade FROM course GROUP BY c_number, c_name, c_grade;
-------------------------------------------
--# ������û ��� ���̺�
create table enroll(
  stu_number number,
  c_number number,
  c_memo varchar2(150),
  primary key(stu_number, c_number)
);

desc enroll;
select * from enroll;

drop table enroll;
delete from enroll;

commit;

-- $ ���ʵ����� ����
insert into enroll(stu_number, c_number, c_memo) values(201158102, 10, '');
insert into enroll(stu_number, c_number, c_memo) values(201158102, 11, '');
-------------------------------------------
--# ���� ������û ��� ���
SELECT c.c_number, c.c_name, c.c_date_time, c.c_grade, e.c_memo FROM course c, enroll e WHERE c.c_number = e.c_number;
-------------------------------------------
--# Ư�� ������û ���� ���� ���� ���
SELECT c.c_number, c.c_date_time FROM course c WHERE c.c_number = 14;
-------------------------------------------
--# ���� ������û ��� ���� ���ϱ�
SELECT COUNT(*) AS course_count FROM enroll;
-------------------------------------------
--# ������û���� ����Ʈ ���� ���ϱ�
select COUNT(*) AS count_col from (SELECT COUNT(*) AS col_count FROM course GROUP BY c_number, c_name, c_grade);
-------------------------------------------
--# �α��� ���� ���ν���
--$ ��� : �α��� ��ȿ�� �˻�, ���̵� �ߺ��˻�, �л����
create or replace procedure PRO_LOGIN_ENROLL(
  -- �Ű����� ����
  in_pro_type IN number, -- type = 1(�α��� ��ȿ�˻�), type = 2(�л����), type = 3(���̵� �ߺ��˻�)
  in_stu_id IN student.stu_id%TYPE,
  in_stu_name IN student.stu_name%TYPE,
  in_stu_password IN student.stu_password%TYPE,
  in_stu_birth IN student.stu_birth%TYPE,
  in_stu_number IN student.stu_number%TYPE,
  in_stu_address IN student.stu_address%TYPE,
  in_stu_deptno IN student.stu_deptno%TYPE,
  in_stu_grade IN student.stu_grade%TYPE,
  in_stu_email IN student.stu_email%TYPE,
  in_stu_phonenumber IN student.stu_phonenumber%TYPE,
  in_stu_photo IN student.stu_photo%TYPE,
  out_result OUT number
)
IS
-- Ŀ������, ����� ���� ����
v_result_col number;
BEGIN
  IF in_pro_type = 1 THEN
    -- �α��� ��ȿ ����
    SELECT COUNT(*) INTO v_result_col FROM student
		WHERE stu_id = in_stu_id AND stu_password = in_stu_password;
    IF v_result_col = 1 THEN
      out_result := 1;
    ELSE
      out_result := 0;
    END IF;
    COMMIT;
  -- �л� ���
  ELSIF in_pro_type = 2 THEN
    INSERT INTO student(stu_id, stu_password,stu_name,stu_birth, stu_number,stu_address,stu_deptno,stu_grade,stu_email,stu_phonenumber,stu_photo ) 
    VALUES(in_stu_id, in_stu_password,in_stu_name,in_stu_birth, in_stu_number, in_stu_address,in_stu_deptno,in_stu_grade,in_stu_email,in_stu_phonenumber,in_stu_photo);
    out_result := 1;
    COMMIT;
  -- ���̵� �ߺ� �˻�
  ELSIF in_pro_type = 3 THEN
    SELECT COUNT(*) INTO v_result_col FROM student WHERE stu_id = in_stu_id;
    IF v_result_col = 1 THEN
      out_result := 1;
    ELSE
      out_result := 0;
    END IF;
    COMMIT;
  ELSE
    out_result := 0;
    COMMIT;
  END IF;
EXCEPTION -- ����ó��
WHEN OTHERS THEN
  out_result := -1;
  ROLLBACK;
END;

--* ���ν��� ���� (OUT���� ��ȯ)
SET SERVEROUTPUT ON -- dbms_output�� �����ϰ� ���ش� ����
DECLARE
  retval number; -- out����
BEGIN
  PRO_LOGIN_ENROLL(1, 'scw0531', '��â��','tjckd246!','92/04/06',201158102,'��⵵ ������',1,4,'scw05313315@gmail.com','01042084757','seopicture.png', retval);
  DBMS_OUTPUT.PUT_LINE('return value: '||retval);
END;
-------------------------------------------
--# ������û ���� ���ν���
--$ ��� : ������û, ��������, �������� �޸��߰�
create or replace procedure PRO_COURSE_MANAGE(
   in_pro_type IN number, -- type = 1(��û), type = 2(����), type = 3(�޸��߰�)
   in_stu_number IN enroll.stu_number%TYPE,
   in_c_number IN enroll.c_number%TYPE,
   in_c_memo IN enroll.c_memo%TYPE,
   out_result OUT number
)
IS
-- Ŀ������, ��������
BEGIN
  IF in_pro_type = 1 THEN
    -- ��û
    out_result := 1;
    COMMIT;
  -- ��û���� ����
  ELSIF in_pro_type = 2 THEN
    DELETE FROM enroll 
		WHERE stu_number = in_stu_number AND c_number = in_c_number;
    out_result := sql%rowcount;
    COMMIT;
  -- �޸��߰�
  ELSIF in_pro_type = 3 THEN
    UPDATE enroll SET c_memo = in_c_memo 
		WHERE stu_number = in_stu_number AND c_number = in_c_number;
    out_result := sql%rowcount;
    COMMIT;
  ELSE
    out_result := 0;
    COMMIT;
  END IF;
EXCEPTION -- ����ó��
WHEN OTHERS THEN
  out_result := -1;
  ROLLBACK;
END;

--* ���ν��� ���� (OUT���� ��ȯ)
SET SERVEROUTPUT ON -- dbms_output�� �����ϰ� ���ش� ����
DECLARE
  retval number; -- out����
BEGIN
  PRO_COURSE_MANAGE(2,201158102, 11, ' ',  retval); -- �޸��߰� ���
  DBMS_OUTPUT.PUT_LINE('return value: '||retval);
END;