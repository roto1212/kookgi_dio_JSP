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

insert into MVCBOARD (idx, name, subject, content, ref, lev, seq)
values (MVCBOARD_idx_seq.nextval, '홍길동', '1등', '1등입니다.', MVCBOARD_idx_seq.currval, 0, 0);
insert into MVCBOARD (idx, name, subject, content, ref, lev, seq)
values (MVCBOARD_idx_seq.nextval, '임꺽정', '2등', '2등입니다.', MVCBOARD_idx_seq.currval, 0, 0);
insert into MVCBOARD (idx, name, subject, content, ref, lev, seq)
values (MVCBOARD_idx_seq.nextval, '장길산', '3등', '3등입니다.', MVCBOARD_idx_seq.currval, 0, 0);
insert into MVCBOARD (idx, name, subject, content, ref, lev, seq)
values (MVCBOARD_idx_seq.nextval, '일지매', '4등', '4등입니다.', MVCBOARD_idx_seq.currval, 0, 0);



