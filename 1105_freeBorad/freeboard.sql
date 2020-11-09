CREATE TABLE "FREEBOARD" (	
    "IDX" NUMBER(*,0) NOT NULL, 
	"NAME" CHAR(20 BYTE) NOT NULL, 
	"PW" CHAR(20 BYTE) NOT NULL, 
	"SUBJECT" VARCHAR2(200 BYTE) NOT NULL, 
	"CONTENT" VARCHAR2(3000 BYTE) NOT NULL, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"HIT" NUMBER(*,0) DEFAULT 0, 
	"IP" CHAR(20 BYTE), 
	"NOTICE" CHAR(3 BYTE) DEFAULT 'no', 
	PRIMARY KEY ("IDX")
    );

delete from freeboard;
drop sequence freeboard_idx_seq;
create sequence freeboard_idx_seq;
commit;

insert into freeboard (idx, name, pw, subject, content, ip)
values (freeboard_idx_seq.nextval, 'ȫ�浿', '1111', '1��', '�Դϴ�.', '111.111.111.111');
insert into freeboard (idx, name, pw, subject, content, ip)
values (freeboard_idx_seq.nextval, '�Ӳ���', '2222', '2��', '�Դϴ�.', '222.222.222.222');
insert into freeboard (idx, name, pw, subject, content, ip)
values (freeboard_idx_seq.nextval, '����', '3333', '3��', '�Դϴ�.', '333.333.333.333');
insert into freeboard (idx, name, pw, subject, content, ip)
values (freeboard_idx_seq.nextval, '������', '4444', '4��', '�Դϴ�.', '444.444.444.444');

select * from freeboard order by idx desc; 
select count(*) from freeboard;

 CREATE TABLE "FREEBOARDCOMMENT" (
    "IDX" NUMBER(*,0) NOT NULL, 
	"REF" NUMBER(*,0), 
	"NAME" CHAR(20 BYTE) NOT NULL, 
	"PW" CHAR(20 BYTE) NOT NULL, 
	"CONTENT" VARCHAR2(2000 BYTE) NOT NULL, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"IP" CHAR(20 BYTE), 
	 PRIMARY KEY ("IDX")
     );
delete from freeboardcomment;
drop sequence freeboardcomment_idx_seq;
create sequence freeboardcomment_idx_seq;
commit;

select * from freeboardcomment order by idx desc; 
select * from freeboardcomment where ref = 341 order by idx desc;