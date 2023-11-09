package com.obbang.model.board;

//업로드 결과 클래스
public class UploadResult {
 private String fileName;

 public UploadResult(String fileName) {
     this.fileName = fileName;
 }

 public String getFileName() {
     return fileName;
 }

}