<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="/resources/css/Administrator/faq.css">
</head>
<body>	
	 <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />	
     <jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main>
        <section>
            <article class="title-box">
                <h1>FAQ</h1>
                <div>
                    <h4>"FAQ를 통해서 원하시는 답변을 쉽고 빠르게 찾아보세요"<br>
                        질문 중 가장 빈도수가 높은 질문들을 모아, 친절한 답변과 함께 제공해드리고 있습니다.</h4>
                    <img src="/resources/images/Administrator/faq.png">
                </div>
            </article>
            <article class="search-box">
                <form action="faq" method="get" id="faqSearch">
                    <select name="faqCat" id="faqCat">
                        <option value="">전체</option>
                        <option value="멍메이트">멍메이트</option>
                        <option value="예약관련">예약관련</option>
                        <option value="서비스이용">서비스이용</option>
                        <option value="기타">기타</option>
                    </select>
                        <input type="text" name="faq" id="faq" autocomplete="off" placeholder="원하는 검색을 입력해주세요."><button type="button">Search</button>
                </form>
            </article>
            <article class="faq-content">
                <div>
                    <ul>
                        <li>전체</li>
                        <li>멍메이트</li>
                        <li>예약관련</li>
                        <li>서비스이용</li>
                        <li>기타</li>
                    </ul>
                </div>
                <table>
                    <tr class="t-tr">
                        <td><img src="/resources/images/Administrator/report.png" class="td-img"></td>
                        <td>카테고리</td>
                        <td>글내용</td>
                        <td class="td">▼</td>
                    </tr>
                    <tr class="faq-answer">
                        <td rowspan="4">Lorem ipsum dolor sit amet consectetur, aliquid dolores deserunt, magnam sint nam distinctio modi tenetur odio?1111</td>
                    </tr>

                    <tr class="t-tr">
                        <td><img src="/resources/images/Administrator/report.png" class="td-img"></td>
                        <td>카테고리</td>
                        <td>글내용</td>
                        <td class="td">▼</td>
                    </tr>
                    <tr class="faq-answer">
                        <td rowspan="4">Lorem ipsum dolor sit amet consectetur, aliquid dolores deserunt, magnam sint nam distinctio modi tenetur odio?222</td>
                    </tr>

                    <tr class="t-tr">
                        <td><img src="/resources/images/Administrator/report.png" class="td-img"></td>
                        <td>카테고리</td>
                        <td>글내용</td>
                        <td class="td">▼</td>
                    </tr>
                    <tr class="faq-answer">
                        <td rowspan="4">Lorem ipsum dolor sit amet consectetur, aliquid dolores deserunt, magnam sint nam distinctio modi tenetur odio?</td>
                    </tr>

                    <tr class="t-tr">
                        <td><img src="/resources/images/Administrator/report.png" class="td-img"></td>
                        <td>카테고리</td>
                        <td>글내용</td>
                        <td class="td">▼</td>
                    </tr>
                    <tr class="faq-answer">
                        <td rowspan="4">Lorem ipsum dolor sit amet consectetur, aliquid dolores deserunt, magnam sint nam distinctio modi tenetur odio?</td>
                    </tr>

                    <tr class="t-tr">
                        <td><img src="/resources/images/Administrator/report.png" class="td-img"></td>
                        <td>카테고리</td>
                        <td>글내용</td>
                        <td class="td">▼</td>
                    </tr>
                    <tr class="faq-answer">
                        <td rowspan="4">Lorem ipsum dolor sit amet consectetur, aliquid dolores deserunt, magnam sint nam distinctio modi tenetur odio?</td>
                    </tr>

                    <tr class="t-tr">
                        <td><img src="/resources/images/Administrator/report.png" class="td-img"></td>
                        <td>카테고리</td>
                        <td>글내용</td>
                        <td class="td">▼</td>
                    </tr>
                    <tr class="faq-answer">
                        <td rowspan="4">Lorem ipsum dolor sit amet consectetur, aliquid dolores deserunt, magnam sint nam distinctio modi tenetur odio?</td>
                    </tr>

                    <tr class="t-tr">
                        <td><img src="/resources/images/Administrator/report.png" class="td-img"></td>
                        <td>카테고리</td>
                        <td>글내용</td>
                        <td class="td">▼</td>
                    </tr>
                    <tr class="faq-answer">
                        <td rowspan="4">Lorem ipsum dolor sit amet consectetur, aliquid dolores deserunt, magnam sint nam distinctio modi tenetur odio?</td>
                    </tr>

                    <tr class="t-tr">
                        <td><img src="/resources/images/Administrator/report.png" class="td-img"></td>
                        <td>카테고리</td>
                        <td>글내용</td>
                        <td class="td">▼</td>
                    </tr>
                    <tr class="faq-answer">
                        <td rowspan="4">Lorem ipsum dolor sit amet consectetur, aliquid dolores deserunt, magnam sint nam distinctio modi tenetur odio?</td>
                    </tr>
                </table>
            </article>
            <div class="pagination">페이지네이션</div>
        </section>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <script src="/resources/js/Administrator/code.jquery.com_jquery-3.7.1.min.js"></script>
    <script src="/resources/js/Administrator/faq.js"></script>
</body>
</html>