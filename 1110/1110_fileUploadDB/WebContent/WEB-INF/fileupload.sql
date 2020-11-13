CREATE TABLE "FILEUPLOAD" (
    "IDX" NUMBER(*,0) NOT NULL , 
	"FILENAME" VARCHAR2(200 BYTE), 
	"COLUMN1" VARCHAR2(200 BYTE), 
	 PRIMARY KEY ("IDX")
);
delete from FILEUPLOAD;
drop sequence FILEUPLOAD_idx_seq;
create sequence FILEUPLOAD_idx_seq;
commit;
