 CREATE TABLE "REGISTER" (
    "USERID" VARCHAR2(20 BYTE) NOT NULL, 
	"USERPW" VARCHAR2(20 BYTE) NOT NULL, 
	"USERNAME" VARCHAR2(20 BYTE) NOT NULL, 
	"USERAGE" NUMBER(*,0) NOT NULL, 
	"USERGENDER" VARCHAR2(20 BYTE) NOT NULL, 
	"USEREMAIL" VARCHAR2(20 BYTE), 
	PRIMARY KEY ("USERID")
     );
     
delete from REGISTER;
drop sequence REGISTER_idx_seq;
create sequence REGISTER_idx_seq;
commit;

select * from register;


