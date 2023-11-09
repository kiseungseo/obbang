<!DOCTYPE html>                                                                                                             
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>                                    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>                                                            
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>                                                           
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>                                    
                                                                                            
<script>                                                                                                                    
var path = "${pageContext.request.contextPath }";                                                                           
                                                                                            
$(document).ready(function() {                                                                                            
                                                                                            
});                                                                                                                       
                                                                                            
</script>                                                                                                                   
                                                                                            
<head>                                                                                                                      
                                                                                                                                                                               
                                                                                            
<title>비밀번호 찾기 결과</title>                                                                                    
                                                                             
</head>                                                                                                                     
                                                                                            
                                                                                            
<body class="bg-gradient-primary">                                                                                          
<div class="container">                                                                                                 
<!-- Outer Row -->                                                                                                  
<div class="row justify-content-center">                                                                            
                                                                                            
<div class="col-xl-10 col-lg-12 col-md-9">                                                                      
                                                                                            
<div class="card o-hidden border-0 shadow-lg my-5">                                                         
<div class="card-body p-0">                                                                             
<!-- Nested Row within Card Body -->                                                                
<div class="row">                                                                                   
<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>                                
<div class="col-lg-6">                                                                          
<div class="p-5">                                                                           
    <div class="text-center">                                                               
        <h1 class="h4 text-gray-900 mb-2">비밀번호를 찾았습니다!!!!</h1><br><br>                 
        <c:choose>                                                                          
            <c:when test="${empty searchVO}">                                                 
                <p class="mb-4">회원 조회결과가 없습니다.</p>                                        
            </c:when>                                                                         
            <c:otherwise>                                                                     
                <p class="mb-4">${searchVO.user_pw}</p>                                              
            </c:otherwise>                                                                    
        </c:choose>                                                                         
    </div>                                                                                  
    <hr>                                                                                                                                                                   
    <div class="text-center">                                                               
        <a class="small" href="/member/join">회원가입 페이지로 가시겠습니까?</a>                    
    </div>                                                                                  
    <div class="text-center">                                                               
        <a class="small" href="/member/login">로그인 페이지로 가시겠습니까?</a>          
    </div>                                                                                  
</div>                                                                                      
</div>                                                                                          
</div>                                                                                              
</div>                                                                                                  
</div>                                                                                                      
                                                                                            
</div>                                                                                                          
                                                                                            
</div>                                                                                                              
                                                                                            
</div>                                                                                                                  
                                                                                            
                                                              
                                                                                            
</body>                                                                                                                     
                                                                                            
                                                                                            
</html>                                                                                                                     
 