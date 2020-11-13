package com.koreait.fileupload;

public class FileVO {
	private int downloadCount;
	private String fileName, fileRealName;
	
	public FileVO() {	}
	
	public FileVO(int downloadCount, String fileName, String fileRealName) {
		super();
		
		this.downloadCount = downloadCount;
		this.fileName = fileName;
		this.fileRealName = fileRealName;
	}



	@Override
	public String toString() {
		return "FileVO [downloadCount=" + downloadCount + ", fileName=" + fileName + ", fileRealName=" + fileRealName
				+ "]";
	}

	public int getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	
	
	
	
	
}
