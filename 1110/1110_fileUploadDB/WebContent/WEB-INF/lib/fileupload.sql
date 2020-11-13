CREATE TABLE "FILEUPLOAD" (
    "IDX" NUMBER(*,0) NOT NULL , 
	"FILENAME" VARCHAR2(200 BYTE), 
	"FILEREALNAME" VARCHAR2(200 BYTE), 
    "DOWNLOADCOUNT" NUMBER(*,0),
	 PRIMARY KEY ("IDX")
);
delete from FILEUPLOAD;
drop sequence FILEUPLOAD_idx_seq;
create sequence FILEUPLOAD_idx_seq;
commit;

select * from fileupload;