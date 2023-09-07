<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="/resources/css/Administrator/petManagement.css">
</head>
<body>	
	 <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />	
     <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <main>
        <div class="petsitterBox">
            <div class="petsitterImg">
                <img src="/resources/images/m.gif">
            </div>
            <div class="petsitterInfo">
                <h3>000펫시터</h3><button>자격박탈</button>
                <table>
                    <tr>
                        <th>예약건수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>예약취소 횟수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>예약일정</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>신고횟수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th><span>★</span> 별점</th>
                        <td><span>★</span> 10</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="petsitterBox">
            <div class="petsitterImg">
                <img src="/resources/images/m.gif">
            </div>
            <div class="petsitterInfo">
                <h3>000펫시터</h3><button>자격박탈</button>
                <table>
                    <tr>
                        <th>예약건수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>예약취소 횟수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>예약일정</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>신고횟수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th><span>★</span> 별점</th>
                        <td><span>★</span> 10</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>
                </table>
            </div>
            
        </div>

        <div class="petsitterBox on">
            <div class="petsitterImg">
                <img src="/resources/images/m.gif">
            </div>
            <div class="petsitterInfo">
                <h3>000펫시터</h3><button>자격박탈</button>
                <table>
                    <tr>
                        <th>예약건수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>예약취소 횟수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>예약일정</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>신고횟수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th><span>★</span> 별점</th>
                        <td><span>★</span> 10</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>
                </table>
            </div>
            
        </div>

        <div class="petsitterBox on">
            <div class="petsitterImg">
                <img src="/resources/images/m.gif">
            </div>
            <div class="petsitterInfo">
                <h3>000펫시터</h3><button>자격박탈</button>
                <table>
                    <tr>
                        <th>예약건수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>예약취소 횟수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>예약일정</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th>신고횟수</th>
                        <td>000건</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>

                    <tr>
                        <th><span>★</span> 별점</th>
                        <td><span>★</span> 10</td>
                        <td>(2023.00.00 기준)</td>
                    </tr>
                </table>
            </div>
            
        </div>
    </main>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
        const box = document.getElementsByClassName("petsitterBox")
        const sc = window.scrollY;
        let boxCount = 3;
        for(let i=3; i<box.length; i++){
            box[i].style.display="none";
        }

        window.addEventListener('scroll', function(){
            /* console.log( window.scrollY )
            console.log(window.innerHeight)
            console.log(document.body.offsetHeight) */
            
            if( (window.innerHeight + window.scrollY) >=document.body.offsetHeight){
                
                if(boxCount < box.length){
                    box[boxCount].style.display="flex";    
                    boxCount++;
                    console.log(boxCount);
                }
                
            }    
            
        });

    </script>
    
    
</body>
</html>