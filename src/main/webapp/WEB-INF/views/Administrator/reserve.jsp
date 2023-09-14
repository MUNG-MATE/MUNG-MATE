<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="/resources/css/Administrator/reserve.css">
</head>
<body>	
     <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
	<main>
        <section>
            <h3>2023년 00 월 00 일 기준 예약현황</h3>
            <table>
                <tbody>
                    <tr>
                        <td>결제 대기중 예약</td>
                        <td>1324건</td>
                        <td>이번달 예약</td>
                        <td>334건</td>
                    </tr>

                    <tr>
                        <td>결제 완료된 예약</td>
                        <td>200건</td>
                        <td>이번달 매출</td>
                        <td>14,010,102,489원</td>
                    </tr>

                    <tr>
                        <td>오늘 예약</td>
                        <td>11건</td>
                        <td>지난달 예약</td>
                        <td>433건</td>
                    </tr>

                    <tr>
                        <td>종료된 예약</td>
                        <td>2013건</td>
                        <td>지난달 매출</td>
                        <td>19,045,056,458 원</td>
                    </tr>

                    <tr>
                        <td>내일 예약</td>
                        <td>14건</td>
                        <td>총 매출</td>
                        <td>112,045,056,458 원</td>
                    </tr>
                </tbody>
                
            </table>

            
        </section>

        <section>
            <table>
                <thead>
                    <th>No</th>
                    <th>▼</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>예약일</th>
                    <th>예약금액</th>
                    <th>결제상태</th>
                    <th>예약관리</th>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>120,000원</td>
                        <td>결제대기중</td>
                        <td><button>취소</button></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>120,000원</td>
                        <td>결제대기중</td>
                        <td><button>취소</button></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>120,000원</td>
                        <td>결제대기중</td>
                        <td><button>취소</button></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>120,000원</td>
                        <td>결제대기중</td>
                        <td><button>취소</button></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>120,000원</td>
                        <td>결제대기중</td>
                        <td><button>취소</button></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>120,000원</td>
                        <td>결제대기중</td>
                        <td><button>취소</button></td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>120,000원</td>
                        <td>결제대기중</td>
                        <td><button>취소</button></td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>120,000원</td>
                        <td>결제대기중</td>
                        <td><button>취소</button></td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>120,000원</td>
                        <td>결제대기중</td>
                        <td><button>취소</button></td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>120,000원</td>
                        <td>결제대기중</td>
                        <td><button>취소</button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="회원번호(추후)"></td>
                        <td>user01@kh.or.kr</td>
                        <td>문광민</td>
                        <td>010-9773-1309</td>
                        <td>2023-00-00</td>
                        <td>120,000원</td>
                        <td>결제대기중</td>
                        <td><button>취소</button></td>
                    </tr>
                    
                </tbody>
            </table>
        </section>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>