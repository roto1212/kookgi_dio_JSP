CREATE TABLE "MVCBOARD" 
   (	"IDX" NUMBER(*,0) NOT NULL , 
	"NAME" CHAR(20 BYTE) NOT NULL , 
	"SUBJECT" VARCHAR2(200 BYTE) NOT NULL , 
	"CONTENT" VARCHAR2(2000 BYTE) NOT NULL , 
	"REF" NUMBER(*,0), 
	"LEV" NUMBER(*,0), 
	"SEQ" NUMBER(*,0), 
	"HIT" NUMBER DEFAULT 0, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	 PRIMARY KEY ("IDX")
     );
     
delete from MVCBOARD;
drop sequence MVCBOARD_idx_seq;
create sequence MVCBOARD_idx_seq;
commit;

select * from MVCBOARD order by ref desc, seq asc;

select count(*) from mvcboard;



