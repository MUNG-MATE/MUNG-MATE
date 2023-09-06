<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="/resources/css/Administrator/management.css">
</head>
<body>	
	 <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />	
     <jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main>
        <section>
            <article class="people">
                <h4>일반사용자 : 00 명</h4><span>||</span><h4>펫시터 : 00명</h4>
            </article>

            <article class="search-box">
                <form action="management" method="get" id="management">
                    <select name="management-type" id="management-type">
                        <option value="">전체</option>
                        <option value="일반회원">일반회원</option>
                        <option value="펫시터">펫시터</option>
                        <option value="탈퇴대기">탈퇴대기</option>
                    </select>
                        <input type="text" name="management-search" id="management-search" autocomplete="off" placeholder="키워드를입력하세요.">
                        <button type="button">검색</button><button type="button">탈퇴</button>
                </form>
            </article>
        </section>

        <section>
            <table>
                <thead>
                    <th>No</th>
                    <th>▼</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>회원가입일</th>
                    <th>펫시터(Y/N)</th>
                    <th>회원탈퇴(Y/N)</th>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>N</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>N</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>N</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>N</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>N</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>N</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>N</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>N</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>N</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>N</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>N</td>
                        <td>N</td>
                    </tr>
                    
                </tbody>
            </table>
        </section>
        <section>
            페이지네이션
        </section>

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
</body>
</html>