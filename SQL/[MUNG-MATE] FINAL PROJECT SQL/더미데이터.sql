--------------------------------------- 더미 데이터 ---------------------------------------

--------------------- 펫시터/일반 회원 신청 
INSERT INTO APPLICATION_TYPE VALUES(1, '일반회원 -> 펫시터');
INSERT INTO APPLICATION_TYPE VALUES(2, '펫시터 -> 일반회원');

--------------------- 서비스타입
INSERT INTO SERVICE_TYPE VALUES(1, '산책', '30분', '20000');
INSERT INTO SERVICE_TYPE VALUES(2, '산책', '60분', '30000');
INSERT INTO SERVICE_TYPE VALUES(3, '산책', '120분', '45000');
INSERT INTO SERVICE_TYPE VALUES(4, '돌봄', '30분', '15000');
INSERT INTO SERVICE_TYPE VALUES(5, '돌봄', '60분', '25000');
INSERT INTO SERVICE_TYPE VALUES(6, '돌봄', '120분', '40000');

--------------------- 회원
INSERT INTO MEMBER
VALUES(2, '김광수', '222@naver.com','광수', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, DEFAULT, 'Y','/resources/images/member/1.png');

INSERT INTO MEMBER
VALUES(3, '문광민', '333@naver.com','광민', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, DEFAULT, 'Y','/resources/images/member/2.png');

INSERT INTO MEMBER
VALUES(4, '박정흠', '444@naver.com','정흠', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, DEFAULT, 'Y','/resources/images/member/3.png');

INSERT INTO MEMBER
VALUES(5, '오서현', '555@naver.com','서현', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, DEFAULT, 'Y','/resources/images/member/4.png');

INSERT INTO MEMBER
VALUES(6, '최용혁', '666@naver.com','용혁', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, DEFAULT, 'Y','/resources/images/member/5.png');

INSERT INTO MEMBER
VALUES(7, '홍승남', '777@naver.com','승남', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, DEFAULT, 'Y','/resources/images/member/6.png');

INSERT INTO MEMBER
VALUES(8, '태양', '888@naver.com','태양', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, DEFAULT, 'N','/resources/images/member/user.png');

INSERT INTO MEMBER
VALUES(9, 'G드래곤', '999@naver.com','드래곤', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, DEFAULT, 'Y','/resources/images/member/user.png');

INSERT INTO MEMBER
VALUES(10, '승리', '10@naver.com','승리', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, DEFAULT, 'N','/resources/images/member/user.png');

INSERT INTO MEMBER
VALUES(11, '최승현', '11@naver.com','최승현', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, DEFAULT, 'N','/resources/images/member/user.png');

INSERT INTO MEMBER
VALUES(12, '대성', '12@naver.com','대성', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, DEFAULT, 'N','/resources/images/member/user.png');

INSERT INTO MEMBER
VALUES(999, '관리자', 'admin@naver.com','관리자', '1', '01012341234', '05219^^^서울 강동구 아리수로72길 46-12^^^1층', DEFAULT, DEFAULT, 'Y', 'N','/resources/images/member/user.png');

--------------------- 펫시터
INSERT INTO PETSITTER
VALUES(SEQ_PETSITTER_NO.NEXTVAL, '서울', 'Y', 2);

INSERT INTO PETSITTER
VALUES(SEQ_PETSITTER_NO.NEXTVAL, '제주', 'Y', 3);

INSERT INTO PETSITTER
VALUES(SEQ_PETSITTER_NO.NEXTVAL, '서울', 'Y', 4);

INSERT INTO PETSITTER
VALUES(SEQ_PETSITTER_NO.NEXTVAL, '부산', 'Y', 5);

INSERT INTO PETSITTER
VALUES(SEQ_PETSITTER_NO.NEXTVAL, '대구', 'Y', 6);

INSERT INTO PETSITTER
VALUES(SEQ_PETSITTER_NO.NEXTVAL, '경기', 'Y',7);

INSERT INTO PETSITTER
VALUES(SEQ_PETSITTER_NO.NEXTVAL, '경기', 'Y',9);


--------------------- 예약(채팅과관련)

-- 9월
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-09-04(월)', '10:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 1);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-09-09(토)', '12:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 2);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-09-11(월)', '14:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 3);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-09-13(수)', '16:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 4);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-09-16(토)', '12:00', '서울 강남구 테헤란로10길 9,5층', 1, 1, 'Y', 5);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-09-19(화)', '11:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 6);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-09-28(목)', '10:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 1);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-09-28(목)', '14:00', '서울 강남구 테헤란로10길 9,5층', 2, 1, 'Y', 2);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-09-28(목)', '16:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 3);

-- 10월
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-02(월)', '08:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 2);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-02(월)', '11:00', '서울 강남구 테헤란로10길 9,5층', 3, 1, 'Y', 2);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-02(월)', '14:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 3);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-04(수)', '07:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 4);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-04(수)', '10:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 5);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-04(수)', '13:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 6);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-05(목)', '08:00', '서울 강남구 테헤란로10길 9,5층', 5, 1, 'Y', 1);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-05(목)', '10:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 2);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-05(목)', '12:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 2);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-05(목)', '13:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'Y', 4);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-05(목)', '16:00', '서울 강남구 테헤란로10길 9,5층', 6, 1, 'Y', 6);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-06(금)', '10:00', '서울 강남구 테헤란로10길 9,5층', 1, 1, 'ING', 6);


-- 11월
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-07(토)', '16:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'N', 6);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-10-07(토)', '18:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'N', 4);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-11-01(수)', '10:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'N', 1);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-11-03(금)', '12:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'N', 2);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-11-11(토)', '14:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'N', 3);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-11-11(토)', '16:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'N', 4);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-11-14(화)', '12:00', '서울 강남구 테헤란로10길 9,5층', 1, 1, 'N', 5);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-11-15(수)', '11:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'N', 6);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-11-19(일)', '10:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'N', 1);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-11-19(일)', '14:00', '서울 강남구 테헤란로10길 9,5층', 2, 1, 'N', 2);
INSERT INTO RESERVATION VALUES(SEQ_RS_NO.NEXTVAL, '2023-11-22(수)', '16:00', '서울 강남구 테헤란로10길 9,5층', 4, 1, 'N', 3);

--------------------- 게시판 타입
INSERT INTO BOARD_TYPE VALUES(1,'공지사항');
INSERT INTO BOARD_TYPE VALUES(2,'전체');
INSERT INTO BOARD_TYPE VALUES(3,'예약관련');
INSERT INTO BOARD_TYPE VALUES(4,'서비스이용');
INSERT INTO BOARD_TYPE VALUES(5,'기타');
INSERT INTO BOARD_TYPE VALUES(6,'리뷰');

--------------------- 신고
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,2,3,'부적절한 행동: 이 펫시터가 동물을 다루는 방식이 부적절합니다. 동물에게 고통을 주거나 어떤 방식으로든 위협을 가합니다. 이로 인해 동물의 안녕과 건강에 위험이 있습니다.','2023-10-05');
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,2,4,'부적절한 대우: 이 펫시터는 동물에 대한 책임을 제대로 지지 않았습니다. 동물에게 충분한 식사와 주의를 주지 않아서 동물의 건강이 나빠지고 있습니다. 이로 인해 동물의 행복과 건강에 위협이 있습니다.','2023-09-14');
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,2,5,'비매너: 이놈이 동물 주인 및 신고자와 예의바르지 않게 행동했습니다. 경솔하고 무례한 행동으로 인해 신고자는 불쾌한 경험을 했습니다.','2023-09-20');
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,2,6,'사기: 이자식은 예약을 받았지만 서비스를 제공하지 않았습니다. 사기 행위로 동물 주인을 속여 돈을 빼앗았으며 이로 인해 동물 주인은 손해를 입었습니다.','2023-08-18');
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,3,1,'예약 무단 취소 신고: 신고 내용: 펫시터가 예약을 무단으로 취소하여 예약한 동물 주인은 예약을 대체할 수 없게 되었습니다.
신고 사유: 펫시터의 예약 무단 취소로 인해 동물 주인은 불편과 손해를 입었으며 펫시터의 예약 취소 정책을 보고하고자 합니다.','2023-09-29');
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,4,2,'동물 돌봄 부주의 신고:

신고 내용: 펫시터가 동물을 돌봄할 때 필요한 주의와 관심을 제공하지 않았습니다. 동물 주인은 동물의 건강에 대한 우려가 있습니다.
신고 사유: 펫시터의 부주의로 인해 동물이 건강에 영향을 받고 있으며 동물의 안녕과 건강을 위해 신고하고자 합니다.','2023-07-07');
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,5,3,'허가 없는 동물 이동 신고:
신고 내용: 펫시터가 동물을 동의 없이 다른 장소로 이동시켰습니다. 동물 주인은 이동에 대한 사전 허가를 받지 않았습니다.
신고 사유: 펫시터의 허가 없는 동물 이동으로 인해 동물 주인은 불편을 겪었으며 동물의 안전과 웰빙을 위해 신고하고자 합니다.','2023-08-15');
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,6,4,'동물 무시 및 불편한 환경 신고:
신고 내용: 펫시터가 동물을 무시하거나 동물이 불편한 환경에서 머무르도록 했습니다.
신고 사유: 펫시터의 행동으로 인해 동물이 불편을 겪었으며 동물의 행복과 안락을 위해 신고하고자 합니다.','2023-09-21');
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,7,5,'부적절한 행동: 이 펫시터가 동물을 다루는 방식이 부적절합니다. 동물에게 고통을 주거나 어떤 방식으로든 위협을 가합니다. 이로 인해 동물의 안녕과 건강에 위험이 있습니다.','2023-06-17');
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,8,6,'부적절한 대우: 이 펫시터는 동물에 대한 책임을 제대로 지지 않았습니다. 동물에게 충분한 식사와 주의를 주지 않아서 동물의 건강이 나빠지고 있습니다. 이로 인해 동물의 행복과 건강에 위협이 있습니다.','2023-08-11');
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,9,1,'비매너: 이놈이 동물 주인 및 신고자와 예의바르지 않게 행동했습니다. 경솔하고 무례한 행동으로 인해 신고자는 불쾌한 경험을 했습니다.','2023-10-01');
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL,8,2,'사기: 이자식은 예약을 받았지만 서비스를 제공하지 않았습니다. 사기 행위로 동물 주인을 속여 돈을 빼앗았으며 이로 인해 동물 주인은 손해를 입었습니다.','2023-10-02');

--------------------- 공지사항
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '기본돌봄이란?','멍메이트 펫시터가 고객의 집으로 찾아가 돌봄을 진행합니다. 기본 30분 진행
배식/급수
배변 처리
환경 정리
요청사항 수행
기본돌봄 범위에 해당하지 않는 요청사항 수행은 불가합니다.
별도 요청사항이 없는 경우 기본돌봄 내용대로 진행됩니다.
(수돗물 급여, 용변 변기처리, 쓰레기 휴지통 처리)' , SYSDATE, 0 ,'N',1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '서비스 가능 지역은 어디인가요??',
'현재 집사는 서울, 경기수도권에서 예약이 가능합니다.
- 활동하는 집사 펫시터가 없는 지역일 경우 서비스 매칭이 어려울 수 있습니다.
' , SYSDATE, 0 ,'N',1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '방문(출입) 정보는 어떻게 보호받나요?',
'3단계의 까다로운 신원 검증 및 반려동물 전문 교육을 수료한 자로 현장경험이 많은 자와 집사를 통해 실전경험을 이수한 시터만이 집사 펫시터로 활동하고 있습니다.
집사 펫시터 분들은 ‘전문인배상책임보험’ 가입까지 되어 있으니 안심할 수 있습니다.
' , SYSDATE, 0 ,'N',1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '방문 산책은 어떤 서비스인가요?',
'방문 산책 예약 시, 아래 서비스가 제공됩니다.
* 안전한 산책 (낯을 많이 가리거나 공격적인 강아지의 경우에, 하네스를 미리 착용해주세요.)
* 발 닦기 - 30분 산책시에는 물티슈 닦기만 가능 - 60분 산책시 물로 씻기 + 닦기 요청 가능 (입질이 심한 경우에는 발 닦기가 불가)
* 환경 정리 - 배변을 변기 또는 일반 쓰레기통에 처리 - 배변 흔적 제거 및 배변 패드 교체 - 사용한 물품을 제자리에 놓는 정리 (반려동물 관련만)
* 제공 불가 서비스 목욕 및 미용 서비스, 애견호텔, 주사(바늘)을 놓는 행위, 세탁 및 청소 유사 서비스, 일반 쓰레기 버리기 및 분리수거, 귀청소, 발톱깎이, 그 외 미용 서비스 제공 불가
' , SYSDATE, 0 ,'N',1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '집사 펫시터 서비스 이용 가능 시간은 어떻게 되나요?',
'집사 펫시터 예약 가능 시간은 오전 8시부터 오후 9시까지입니다.' , SYSDATE, 0 ,'N',1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '서비스 이용 전 필요한 준비사항은 뭐가 있나요?',
' 아래의 필요한 용품은 펫시터님이 찾기 쉽게 한 곳에 모아 놓아주세요.
- 강아지: 사료, 간식, 장난감, 하네스 (산책 시), 산책 줄 (산책 시), 배변 패드, 빗, 물티슈
- 고양이: 사료, 간식, 장난감, 여분의 모래, 화장실 삽, 배변 패드 (필요시), 빗, 물티슈' , SYSDATE, 0 ,'N',1,999);


INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, ' 예약 취소 정책은 어떻게 되나요?',
'예약 취소 정책은 펫시터와 동물 주인 모두에게 중요한 사항입니다. 예약을 취소할 경우, 예약 날짜와 시간에 따라 수수료가 부과될 수 있으며, 자주 취소하는 경우에는 제재가 가해질 수 있습니다. 동물 주인과 펫시터 간의 상호 신뢰를 유지하기 위해 정책을 준수해주세요. 자세한 정보는 아래와 같습니다' , SYSDATE, 0 ,'N',1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '예약 관리는 어떻게 할 수 있나요?',
'펫시터로서 예약 관리는 중요한 부분입니다. 효과적인 관리를 위해 다음 팁을 따르세요.

일정 업데이트: 예약된 일정을 항상 최신으로 유지하고, 동물 주인들에게 업데이트를 제공하세요.
시간 유연성: 예약한 동물 주인과 유연한 시간 조율을 위해 노력하세요.
프로필 상태: 예약 가능한 상태를 프로필에 정확하게 표시하세요.
자세한 관리 방법은 [링크]에서 확인 가능합니다.
' , SYSDATE, 0 ,'N',1,999);


INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '응급 상황에서 어떻게 대처해야 하나요?',
'동물이 응급 상황에 처했을 때 대처 방법을 알고 있어야 합니다. 아래는 응급 상황에서 취해야 할 조치입니다.

긴급 연락: 동물 병원 또는 동물 의료 전문가에게 연락하세요.
상황 평가: 상황을 평가하고 동물 주인에게 상황을 설명하세요.
응급 처치: 가능한 경우 응급 처치를 시도하세요. (단, 안전한 방법으로)
응급 대처에 대한 자세한 안내는 [링크]에서 확인 가능합니다.',SYSDATE, 0 ,'N',1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '방문 산책은 어떤 서비스인가요?',
'방문 산책 예약 시, 아래 서비스가 제공됩니다.
* 안전한 산책 (낯을 많이 가리거나 공격적인 강아지의 경우에, 하네스를 미리 착용해주세요.)
* 발 닦기 - 30분 산책시에는 물티슈 닦기만 가능 - 60분 산책시 물로 씻기 + 닦기 요청 가능 (입질이 심한 경우에는 발 닦기가 불가)
* 환경 정리 - 배변을 변기 또는 일반 쓰레기통에 처리 - 배변 흔적 제거 및 배변 패드 교체 - 사용한 물품을 제자리에 놓는 정리 (반려동물 관련만)
* 제공 불가 서비스 목욕 및 미용 서비스, 애견호텔, 주사(바늘)을 놓는 행위, 세탁 및 청소 유사 서비스, 일반 쓰레기 버리기 및 분리수거, 귀청소, 발톱깎이, 그 외 미용 서비스 제공 불가
',SYSDATE, 0 ,'N',1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '집사 펫시터는 어떤 서비스를 제공하나요?',
' 방문 산책, 방문 돌봄
> 반려동물 전문가들의 교육 이수 및 관련 자격증을 취득한 펫시터분들이 고객님의 집에 직접 방문하여, 방문 돌봄과 방문 산책 서비스를 제공합니다.
- 방문 산책 : 안전한 산책과 배와 발 닦기까지
- 방문 돌봄 : 고양이와 강아지까지 고객님의 집에 방문하여 돌봄
- 바로 방문 : 즉시 호출로 돌봄이 필요할 경우, 2시간 이내에 방문
- 정기 방문 : 매주 원하는 요일에 펫시터가 정기적으로 방문
',SYSDATE, 0 ,'N',1,999);


INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '방문 산책은 어떤 서비스인가요?',
'방문 산책 예약 시, 아래 서비스가 제공됩니다.
* 안전한 산책 (낯을 많이 가리거나 공격적인 강아지의 경우에, 하네스를 미리 착용해주세요.)
* 발 닦기 - 30분 산책시에는 물티슈 닦기만 가능 - 60분 산책시 물로 씻기 + 닦기 요청 가능 (입질이 심한 경우에는 발 닦기가 불가)
* 환경 정리 - 배변을 변기 또는 일반 쓰레기통에 처리 - 배변 흔적 제거 및 배변 패드 교체 - 사용한 물품을 제자리에 놓는 정리 (반려동물 관련만)
* 제공 불가 서비스 목욕 및 미용 서비스, 애견호텔, 주사(바늘)을 놓는 행위, 세탁 및 청소 유사 서비스, 일반 쓰레기 버리기 및 분리수거, 귀청소, 발톱깎이, 그 외 미용 서비스 제공 불가
',SYSDATE, 0 ,'N',1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '집사 펫시터는 어떤 서비스를 제공하나요?',
' 방문 산책, 방문 돌봄
> 반려동물 전문가들의 교육 이수 및 관련 자격증을 취득한 펫시터분들이 고객님의 집에 직접 방문하여, 방문 돌봄과 방문 산책 서비스를 제공합니다.
- 방문 산책 : 안전한 산책과 배와 발 닦기까지
- 방문 돌봄 : 고양이와 강아지까지 고객님의 집에 방문하여 돌봄
- 바로 방문 : 즉시 호출로 돌봄이 필요할 경우, 2시간 이내에 방문
- 정기 방문 : 매주 원하는 요일에 펫시터가 정기적으로 방문
',SYSDATE, 0 ,'N',1,999);



INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '서비스 이용 전 필요한 준비사항은 뭐가 있나요?',
' 아래의 필요한 용품은 펫시터님이 찾기 쉽게 한 곳에 모아 놓아주세요.
- 강아지: 사료, 간식, 장난감, 하네스 (산책 시), 산책 줄 (산책 시), 배변 패드, 빗, 물티슈
- 고양이: 사료, 간식, 장난감, 여분의 모래, 화장실 삽, 배변 패드 (필요시), 빗, 물티슈' , SYSDATE, 0 ,'N',1,999);


INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, ' 예약 취소 정책은 어떻게 되나요?',
'예약 취소 정책은 펫시터와 동물 주인 모두에게 중요한 사항입니다. 예약을 취소할 경우, 예약 날짜와 시간에 따라 수수료가 부과될 수 있으며, 자주 취소하는 경우에는 제재가 가해질 수 있습니다. 동물 주인과 펫시터 간의 상호 신뢰를 유지하기 위해 정책을 준수해주세요. 자세한 정보는 아래와 같습니다' , SYSDATE, 0 ,'N',5,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '예약 관리는 어떻게 할 수 있나요?',
'펫시터로서 예약 관리는 중요한 부분입니다. 효과적인 관리를 위해 다음 팁을 따르세요.

일정 업데이트: 예약된 일정을 항상 최신으로 유지하고, 동물 주인들에게 업데이트를 제공하세요.
시간 유연성: 예약한 동물 주인과 유연한 시간 조율을 위해 노력하세요.
프로필 상태: 예약 가능한 상태를 프로필에 정확하게 표시하세요.
자세한 관리 방법은 [링크]에서 확인 가능합니다.
' , SYSDATE, 0 ,'N',1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '방문 펫시터와 실내 놀이로 강아지 가을나기 :)', '안녕하세요. 멍메이트 입니다! 습하고 무더운 여름이 지나가고 본격적인 가을이 시작되고 있습니다.

여러분은 강아지들의 가을나기를 어떻게 준비하고 계신가요? 이런 날을 대비해서 멍메이트 방문 펫시터가 실내 놀이를 준비했습니다!!

혼자서 견주를 기다리는 강아지를 위해 방문 펫시터가 실내놀이 프로그램을 준비했어요!!

실내놀이는 친화과정으로 시작해서 정서활동과 신체활동, 노즈워크와 터그놀이등 다양하게 구성되었습니다.

집에서 혼자 나를 기다리는 우리 강아지 가을나기, 에너지 방출을 위해 방문펫시터 실내놀이를 선물해주세요!!', SYSDATE, DEFAULT, DEFAULT, 1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '애견 호텔 찾지 말고, 강아지 전문가 멍메이트 펫시터!', '혹시 강아지가 하루종일 집에서 기다리고 있지는 않나요? 강아지를 돌봐줄 곳을 생각하면 많은 분들이 애견호텔을 떠올리시는것 같아요.

애견호텔 검색만 해도 크고 작은 사고들을 많이 확인할 수 있습니다. 또한 제한된 부분이 많아서 여러가지 확인해보셔야 할텐데요!!

1. 강아지가 낯선 사람, 낯선 강아지와 잘 지내나요?

2. 제한된 공간에서 지내는 것에 거부감이 없나요?

3. 분리돌봄이 가능한 곳인가요?

4. 하루에 한번씩 산책이 가능한가요?

네가지 질문에 모두 만족스럽지 않다면 애견호텔보다는 편안한 우리집 돌봄인 멍메이트 방문펫시터를 추천해드립니다!!', SYSDATE, DEFAULT, DEFAULT, 1,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '[추석 강아지 맡길 곳] 집에 강아지 혼자 두고 가지 마세요!!', '반려동물과 함께하는 분들은 곧 다가올 추석을 어떻게 계획하고 계시는지 궁금하네요~

설마, 밥만 가득 주고 가시는건 아니죠? 추석 강아지 맡길 곳 알아보고 계신다면 꼭 참고하셔야 하는 정보들을 알려드릴게요!

1. 동물병원 - 가장 많은 분들이 쉽게 접하실 수 있는 곳이라고 생각되는데요. 다른 강아지들과 같이 노는 시람이 없기에 사회성이 부족한 강아지는 OK 
그러나 병원 특성 상 질병이 있거나 치료가 필요한 강아지들이 많이 오는 곳이라 병을 옮을 가능성노 높습니다ㅠ

2. 강아지 유치원 - 강아지 유치원은 등, 하원을 바탕으로 숙박까지 제공하기도 하는데요. 여러가지 프로그램을 진행하는 장점이 있습니다.
하지만 사회화가 부족한 강아지의 경우 여러 마리 같이 지내야 하기 떄문에 힘들어 할 수 있습니다.

3. 개인 위탁처 - 근처에 거주하는 사람들을 쉽게 구할수 있는 장점이 있습니다. 
하지만 사건과 사고가 발생해도 배상을 책임지지 않을 가능성이 큽니다.

4. 전문 펫시터 - 개인 펫시터가 아닌 전문 교육을 받은 사람만 펫시터로 선발됩니다. 개인 가정집에 우리 강아지만 맡겨지기 때문에 자유롭게 지낼 수 있고,
하루에 한번 꼭 산책을 진행하기 때문에 강아지들의 스트레스 또한 해소할 수 있습니다. 무엇보다 신원이 확실한 사람들이기 때문에 신뢰할 수 있습니다.', SYSDATE, DEFAULT, DEFAULT, 1,999);

--------------------- 예약관련
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '기본돌봄이란?','멍메이트 펫시터가 고객의 집으로 찾아가 돌봄을 진행합니다. 기본 30분 진행
배식/급수
배변 처리
환경 정리
요청사항 수행
기본돌봄 범위에 해당하지 않는 요청사항 수행은 불가합니다.
별도 요청사항이 없는 경우 기본돌봄 내용대로 진행됩니다.
(수돗물 급여, 용변 변기처리, 쓰레기 휴지통 처리)' , SYSDATE, 0 ,'N',3,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '서비스 가능 지역은 어디인가요??',
'현재 집사는 서울, 경기수도권에서 예약이 가능합니다.
- 활동하는 집사 펫시터가 없는 지역일 경우 서비스 매칭이 어려울 수 있습니다.
' , SYSDATE, 0 ,'N',3,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '방문(출입) 정보는 어떻게 보호받나요?',
'3단계의 까다로운 신원 검증 및 반려동물 전문 교육을 수료한 자로 현장경험이 많은 자와 집사를 통해 실전경험을 이수한 시터만이 집사 펫시터로 활동하고 있습니다.
집사 펫시터 분들은 ‘전문인배상책임보험’ 가입까지 되어 있으니 안심할 수 있습니다.
' , SYSDATE, 0 ,'N',3,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '방문 산책은 어떤 서비스인가요?',
'방문 산책 예약 시, 아래 서비스가 제공됩니다.
* 안전한 산책 (낯을 많이 가리거나 공격적인 강아지의 경우에, 하네스를 미리 착용해주세요.)
* 발 닦기 - 30분 산책시에는 물티슈 닦기만 가능 - 60분 산책시 물로 씻기 + 닦기 요청 가능 (입질이 심한 경우에는 발 닦기가 불가)
* 환경 정리 - 배변을 변기 또는 일반 쓰레기통에 처리 - 배변 흔적 제거 및 배변 패드 교체 - 사용한 물품을 제자리에 놓는 정리 (반려동물 관련만)
* 제공 불가 서비스 목욕 및 미용 서비스, 애견호텔, 주사(바늘)을 놓는 행위, 세탁 및 청소 유사 서비스, 일반 쓰레기 버리기 및 분리수거, 귀청소, 발톱깎이, 그 외 미용 서비스 제공 불가
' , SYSDATE, 0 ,'N',3,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '집사 펫시터 서비스 이용 가능 시간은 어떻게 되나요?',
'집사 펫시터 예약 가능 시간은 오전 8시부터 오후 9시까지입니다.' , SYSDATE, 0 ,'N',3,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '서비스 이용 전 필요한 준비사항은 뭐가 있나요?',
' 아래의 필요한 용품은 펫시터님이 찾기 쉽게 한 곳에 모아 놓아주세요.
- 강아지: 사료, 간식, 장난감, 하네스 (산책 시), 산책 줄 (산책 시), 배변 패드, 빗, 물티슈
- 고양이: 사료, 간식, 장난감, 여분의 모래, 화장실 삽, 배변 패드 (필요시), 빗, 물티슈' , SYSDATE, 0 ,'N',3,999);


INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, ' 예약 취소 정책은 어떻게 되나요?',
'예약 취소 정책은 펫시터와 동물 주인 모두에게 중요한 사항입니다. 예약을 취소할 경우, 예약 날짜와 시간에 따라 수수료가 부과될 수 있으며, 자주 취소하는 경우에는 제재가 가해질 수 있습니다. 동물 주인과 펫시터 간의 상호 신뢰를 유지하기 위해 정책을 준수해주세요. 자세한 정보는 아래와 같습니다' , SYSDATE, 0 ,'N',3,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '예약 관리는 어떻게 할 수 있나요?',
'펫시터로서 예약 관리는 중요한 부분입니다. 효과적인 관리를 위해 다음 팁을 따르세요.

일정 업데이트: 예약된 일정을 항상 최신으로 유지하고, 동물 주인들에게 업데이트를 제공하세요.
시간 유연성: 예약한 동물 주인과 유연한 시간 조율을 위해 노력하세요.
프로필 상태: 예약 가능한 상태를 프로필에 정확하게 표시하세요.
자세한 관리 방법은 [링크]에서 확인 가능합니다.
' , SYSDATE, 0 ,'N',3,999);


INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '응급 상황에서 어떻게 대처해야 하나요?',
'동물이 응급 상황에 처했을 때 대처 방법을 알고 있어야 합니다. 아래는 응급 상황에서 취해야 할 조치입니다.

긴급 연락: 동물 병원 또는 동물 의료 전문가에게 연락하세요.
상황 평가: 상황을 평가하고 동물 주인에게 상황을 설명하세요.
응급 처치: 가능한 경우 응급 처치를 시도하세요. (단, 안전한 방법으로)
응급 대처에 대한 자세한 안내는 [링크]에서 확인 가능합니다.',SYSDATE, 0 ,'N',3,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '방문 산책은 어떤 서비스인가요?',
'방문 산책 예약 시, 아래 서비스가 제공됩니다.
* 안전한 산책 (낯을 많이 가리거나 공격적인 강아지의 경우에, 하네스를 미리 착용해주세요.)
* 발 닦기 - 30분 산책시에는 물티슈 닦기만 가능 - 60분 산책시 물로 씻기 + 닦기 요청 가능 (입질이 심한 경우에는 발 닦기가 불가)
* 환경 정리 - 배변을 변기 또는 일반 쓰레기통에 처리 - 배변 흔적 제거 및 배변 패드 교체 - 사용한 물품을 제자리에 놓는 정리 (반려동물 관련만)
* 제공 불가 서비스 목욕 및 미용 서비스, 애견호텔, 주사(바늘)을 놓는 행위, 세탁 및 청소 유사 서비스, 일반 쓰레기 버리기 및 분리수거, 귀청소, 발톱깎이, 그 외 미용 서비스 제공 불가
',SYSDATE, 0 ,'N',3,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '집사 펫시터는 어떤 서비스를 제공하나요?',
' 방문 산책, 방문 돌봄
> 반려동물 전문가들의 교육 이수 및 관련 자격증을 취득한 펫시터분들이 고객님의 집에 직접 방문하여, 방문 돌봄과 방문 산책 서비스를 제공합니다.
- 방문 산책 : 안전한 산책과 배와 발 닦기까지
- 방문 돌봄 : 고양이와 강아지까지 고객님의 집에 방문하여 돌봄
- 바로 방문 : 즉시 호출로 돌봄이 필요할 경우, 2시간 이내에 방문
- 정기 방문 : 매주 원하는 요일에 펫시터가 정기적으로 방문
',SYSDATE, 0 ,'N',3,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '예약은 어디에서 하나요?', '멍메이트 웹사이트를 통해 쉽고 간편하게 예약을 진행하실 수 있습니다.', SYSDATE, DEFAULT, DEFAULT, 3,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '고양이도 예약할 수 있나요?', '불가능입니다. 멍메이트의 방문 서비스는 반려견만 가능합니다.', SYSDATE, DEFAULT, DEFAULT, 3,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '방문 돌봄 서비스는 어떻게 진행되나요?', '"방문 돌봄 예약 시, 아래 서비스가 제공됩니다.

* 맞춤 식사
- 요청하신 양만큼을 그릇에 배식
- 사료 및 물 그릇 세척

*실내 놀이
- 노즈워크와 같은 후각 놀이 또는 터그 놀이
- 미세먼지가 심한 날에는, 실내 산책 놀이

*환경 정리
- 배변을 변기 또는 일반 쓰레기통에 처리
- 배변 흔적 제거 및 배변 패드 교체
- 사용한 물품을 제자리에 놓는 정리"', SYSDATE, DEFAULT, DEFAULT, 3,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '방문 산책 서비스는 어떻게 진행되나요?', '"방문 산책 예약 시, 아래 서비스가 제공됩니다.

* 안전한 산책
- 함께 호흡 맞추며 안전한 핸들링
- 다른 반려견과의 접촉 제한
- 모르는 사람과의 접촉 제한
- 길가 이물질 접촉 주의

* 발 닦기
- 30분 산책시에는 물티슈 닦기만 가능
- 60분 삭책시 물로 씻기 + 닦기 요청 가능
( 입질이 심한 경우에는 발 닦기가 불가능할 수 있습니다. )
"', SYSDATE, DEFAULT, DEFAULT, 3,999);

--------------------- 기타
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '서비스 이용 전 필요한 준비사항은 뭐가 있나요?',
' 아래의 필요한 용품은 펫시터님이 찾기 쉽게 한 곳에 모아 놓아주세요.
- 강아지: 사료, 간식, 장난감, 하네스 (산책 시), 산책 줄 (산책 시), 배변 패드, 빗, 물티슈
- 고양이: 사료, 간식, 장난감, 여분의 모래, 화장실 삽, 배변 패드 (필요시), 빗, 물티슈' , SYSDATE, 0 ,'N',5,999);


INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, ' 예약 취소 정책은 어떻게 되나요?',
'예약 취소 정책은 펫시터와 동물 주인 모두에게 중요한 사항입니다. 예약을 취소할 경우, 예약 날짜와 시간에 따라 수수료가 부과될 수 있으며, 자주 취소하는 경우에는 제재가 가해질 수 있습니다. 동물 주인과 펫시터 간의 상호 신뢰를 유지하기 위해 정책을 준수해주세요. 자세한 정보는 아래와 같습니다' , SYSDATE, 0 ,'N',5,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '예약 관리는 어떻게 할 수 있나요?',
'펫시터로서 예약 관리는 중요한 부분입니다. 효과적인 관리를 위해 다음 팁을 따르세요.

일정 업데이트: 예약된 일정을 항상 최신으로 유지하고, 동물 주인들에게 업데이트를 제공하세요.
시간 유연성: 예약한 동물 주인과 유연한 시간 조율을 위해 노력하세요.
프로필 상태: 예약 가능한 상태를 프로필에 정확하게 표시하세요.
자세한 관리 방법은 [링크]에서 확인 가능합니다.
' , SYSDATE, 0 ,'N',5,999);

--------------------- 서비스 이용
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '방문 산책은 어떤 서비스인가요?',
'방문 산책 예약 시, 아래 서비스가 제공됩니다.
* 안전한 산책 (낯을 많이 가리거나 공격적인 강아지의 경우에, 하네스를 미리 착용해주세요.)
* 발 닦기 - 30분 산책시에는 물티슈 닦기만 가능 - 60분 산책시 물로 씻기 + 닦기 요청 가능 (입질이 심한 경우에는 발 닦기가 불가)
* 환경 정리 - 배변을 변기 또는 일반 쓰레기통에 처리 - 배변 흔적 제거 및 배변 패드 교체 - 사용한 물품을 제자리에 놓는 정리 (반려동물 관련만)
* 제공 불가 서비스 목욕 및 미용 서비스, 애견호텔, 주사(바늘)을 놓는 행위, 세탁 및 청소 유사 서비스, 일반 쓰레기 버리기 및 분리수거, 귀청소, 발톱깎이, 그 외 미용 서비스 제공 불가
',SYSDATE, 0 ,'N',4,999);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '집사 펫시터는 어떤 서비스를 제공하나요?',
' 방문 산책, 방문 돌봄
> 반려동물 전문가들의 교육 이수 및 관련 자격증을 취득한 펫시터분들이 고객님의 집에 직접 방문하여, 방문 돌봄과 방문 산책 서비스를 제공합니다.
- 방문 산책 : 안전한 산책과 배와 발 닦기까지
- 방문 돌봄 : 고양이와 강아지까지 고객님의 집에 방문하여 돌봄
- 바로 방문 : 즉시 호출로 돌봄이 필요할 경우, 2시간 이내에 방문
- 정기 방문 : 매주 원하는 요일에 펫시터가 정기적으로 방문
',SYSDATE, 0 ,'N',4,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '돌봄 또는 산책는 어떤 서비스를 제공하나요?', '반려동물을 사랑하는 우리의 펫시터분들이 직접 집에 방문하여, 방문 돌봄과 방문 산책(도그워커) 서비스를 제공합니다.', SYSDATE, DEFAULT, DEFAULT, 4,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '서비스 가능 지역은 어디인가요?', '현재 방문 돌봄 서비스는 서울, 경기, 인천, 대전, 대구, 부산, 세종, 울산, 광주에서 예약이 가능합니다.', SYSDATE, DEFAULT, DEFAULT, 4,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '새벽이나 밤 늦게도 이용할수 있나요?', '멍메이트 펫시터 예약 시간은 오전 8시부터 오후 9시까지 입니다.', SYSDATE, DEFAULT, DEFAULT, 4,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '서비스 이용 요금은 어떻게 되나요?', '"돌봄, 산책의 시간별 요금은 아래와 같습니다.

[방문돌봄]

30분 : 19,500원
60분 : 28,500원
120분 : 42,000원

[방문 산책]

30분 : 19,000원
60분 : 28,500원
120분 : 40,000원입니다."', SYSDATE, DEFAULT, DEFAULT, 4,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '서비스 이용 전 필요한 준비사항은 뭐가 있나요?', '* 아래의 필요한 용품은 펫시터님이 찾기 쉽게 한곳에 모아 놓아주세요<br><br>- 준비물 : 사료, 간식, 장난감, 하네스, 산책 줄, 배변패드, 빗, 물티슈<br><br>*아래 사항에 대해 펫시터님꼐 미리 알려주세요.<br><br>- 펫시팅에 필요한 용품을 모아둔 위치<br><br>- 급식할 사료의 양<br><br>- 식수 제공 방법 예) 정수기, 자동 급수 등<br><br>- 산책 시 발 세척 방법 ( 30분 산책 시, 시간 관계상 물티슈 닦기만 가능  )', SYSDATE, DEFAULT, DEFAULT, 4,999);
--------------------- 리뷰
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '최고의 펫시터 서비스', '이 펫시터 서비스를 이용하고 정말 만족했습니다. 펫시터 분이 우리 강아지를 아주 잘 돌봐주셨고, 신속한 응답과 친절한 서비스로 매우 감동했습니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '강아지 펫시터 추천합니다!', '우리 고양이를 위한 펫시터를 오랜 시간 찾았는데, 이 펫시터분은 정말 대단하십니다. 고양이를 편안하게 느끼게 해주는 서비스를 제공해줘서 감사합니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '긴 출장 기간 동안 믿을 수 있는 펫시터', '여행 중에 강아지를 돌봐줄 신뢰할 수 있는 펫시터를 찾다가 이곳을 발견했습니다. 정말 덕분에 마음 편하게 여행을 즐길 수 있었습니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '친절하고 전문적인 펫시터', '펫시터분이 정말 친절하시고, 반려동물 돌봄에 대한 전문 지식을 가지고 계셔서 안심하고 맡길 수 있었습니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '펫시터와 반려견 간의 환상적인 유대감', '우리 반려견이 펫시터분과 정말 잘 지내는 모습을 보고 놀랐습니다. 서로의 존중과 사랑이 느껴져서 감동했습니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '펫시터 분들이 고생하십니다!', '우리 반려동물을 돌봐주시는 펫시터 분들에게 감사드립니다. 항상 잘 케어해주시고, 어떤 상황에서도 신속하게 대처해주십니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '펫시터와 함께하는 행복한 일상', '펫시터와 함께하는 일상이 정말 행복합니다. 우리 강아지와의 소중한 시간을 공유하며 즐기고 있어요.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '펫시터의 추천 메뉴: 산책과 놀이', '펫시터분이 항상 우리 고양이를 즐겁게 해주는 비결은 산책과 놀이입니다. 고양이가 건강하게 자랄 수 있도록 도와주셔서 감사합니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '펫시터의 프로페셔널한 서비스', '펫시터분들은 정말 프로페셔널하게 일하십니다. 펫시팅 경험 중 가장 신뢰할 만한 곳 중 하나입니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '펫시터의 따뜻한 마음', '펫시터분들은 우리 반려동물을 마치 자기 자식처럼 대해주시는 것 같습니다. 그 마음에 감동받고 있습니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '펫시터와의 멋진 경험 공유', '우리 강아지와 함께 펫시터와의 경험을 공유하고 싶어서 이렇게 글을 남깁니다. 정말 멋진 시간을 보내고 있어요.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '고양이 펫시터가 고양이와 함께하는 일상', '고양이 펫시터와 함께하는 일상은 정말 다양합니다. 고양이가 행복하게 지내도록 도와주는 모습이 멋지네요.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '펫시터의 응급상황 대처 능력에 감동', '긴 출장 중 강아지가 응급 상황에 처했을 때, 펫시터분의 빠른 대응과 의료 지식으로 안심하고 있을 수 있었습니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '펫시터와 함께하는 펫 테라피', '펫시터와의 시간은 마치 펫 테라피처럼 효과가 있습니다. 스트레스 해소와 함께 반려동물을 향한 사랑이 느껴집니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '펫시터를 만나면서 펫파밀리가 된 느낌', '펫시터와의 만남으로 우리 가족은 더 큰 펫파밀리가 된 것 같아요. 고맙습니다!', SYSDATE, DEFAULT, DEFAULT, 6,999);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '펫시터 분들이 고생하십니다!', '반려동물을 사랑하는 우리의 펫시터분들이 직접 집에 방문하여, 방문 돌봄과 방문 산책(도그워커) 서비스를 제공합니다.', SYSDATE, DEFAULT, DEFAULT, 6,999);

--------------------- 리뷰이미지
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review.jpg',0,DEFAULT,45);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review2.jpg',0,DEFAULT,46);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review.jpg',0,DEFAULT,47);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review4.jpg',0,DEFAULT,48);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review.jpg',0,DEFAULT,49);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review1.jpg',0,DEFAULT,50);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review.jpg',0,DEFAULT,51);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review3.jpg',0,DEFAULT,52);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review.jpg',0,DEFAULT,53);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review5.jpg',0,DEFAULT,54);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review.jpg',0,DEFAULT,55);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review.jpg',0,DEFAULT,56);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review6.jpg',0,DEFAULT,57);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review.jpg',0,DEFAULT,58);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review.jpg',0,DEFAULT,59);
INSERT INTO BOARD_IMAGE VALUES(SEQ_BOARD_IMG_NO.NEXTVAL,'/resources/images/member/review.jpg',0,DEFAULT,60);

--------------------- 애완견
INSERT INTO "PET" VALUES(SEQ_PET_NO.NEXTVAL, 1, '누리', '시츄', '2018년 3월', '남', '/resources/images/pet/nuri.jpg', '너무 귀여워요..');

-- 예약 애완견 일단 보류
INSERT INTO RESERVATION_PET VALUES(1, 1);
INSERT INTO RESERVATION_PET VALUES(2, 1);
INSERT INTO RESERVATION_PET VALUES(3, 1);
INSERT INTO RESERVATION_PET VALUES(4, 1);
INSERT INTO RESERVATION_PET VALUES(5, 1);
INSERT INTO RESERVATION_PET VALUES(6, 1);
INSERT INTO RESERVATION_PET VALUES(7, 1);
INSERT INTO RESERVATION_PET VALUES(8, 1);
INSERT INTO RESERVATION_PET VALUES(9, 1);
INSERT INTO RESERVATION_PET VALUES(10, 1);
INSERT INTO RESERVATION_PET VALUES(11, 1);
INSERT INTO RESERVATION_PET VALUES(12, 1);
INSERT INTO RESERVATION_PET VALUES(13, 1);
INSERT INTO RESERVATION_PET VALUES(14, 1);
INSERT INTO RESERVATION_PET VALUES(15, 1);
INSERT INTO RESERVATION_PET VALUES(16, 1);
INSERT INTO RESERVATION_PET VALUES(17, 1);
INSERT INTO RESERVATION_PET VALUES(18, 1);
INSERT INTO RESERVATION_PET VALUES(19, 1);
INSERT INTO RESERVATION_PET VALUES(20, 1);

--------------------- 라이브카드
INSERT INTO LIVE_CARD VALUES(SEQ_LIVE_NO.NEXTVAL, '오랜만에 만났는데도 반갑게 다가와준 누리❤️ 순조롭게 산책 진행했습니다!
여전히 너무 예쁘고, 털이 윤기가 흐르네요! 저를 알아보는 것 같아 너무 사랑스러웠어요!!😍
아기 때부터 봐왔던 누리는 어른이 되어도 너무 예쁘고 상냥한데 보호자님 눈에는 얼마나 더 예뻐보일까요😊
30분이 너무 빨리 지나가버렸어요! 다음에 또 만나자~ 라고 하니 현관문까지 따라와서 인사하듯이 눈인사를 해주더라구요
우리 예쁜 누리! 다음에 또 만나길 바라며 이만 인사드리겠습니다!', '오후 03:00', '오후 03:32', 1);

INSERT INTO LIVE_CARD_IMAGE VALUES(SEQ_LIVE_IMG_NO.NEXTVAL, '/resources/images/live/', 'nuri_stroll.jpg', 'nuri_stroll.jpg', 0, 1);

COMMIT;
--------------------------------------------------------------------------------------------