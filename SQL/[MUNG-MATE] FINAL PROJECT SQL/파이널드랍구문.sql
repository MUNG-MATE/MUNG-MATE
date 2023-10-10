---------------------------------- 테이블 ---------------------------------------
-- 전체잡아서 2번 돌리면 깔끔하게 다삭제됨
DROP TABLE "BOARD_IMAGE";
DROP TABLE "PETSITTER";
DROP TABLE "RESERVATION";
DROP TABLE "PET";
DROP TABLE "REPLY";
DROP TABLE "REPORT";
DROP TABLE "CHATTING_ROOM";
DROP TABLE "APPLICATION_TYPE";
DROP TABLE "APPLICATION";
DROP TABLE "AUTH_KEY";
DROP TABLE "CHATTING_MESSAGE";
DROP TABLE "RESERVATION_PET";
DROP TABLE "LIVE_CARD";
DROP TABLE "PAYMENT";
DROP TABLE "LOCATION_SERVICE";
DROP TABLE "WISH_LIST";
DROP TABLE "LIVE_CARD_IMAGE";
DROP TABLE "SERVICE_TYPE";
DROP TABLE "BOARD";
DROP TABLE "PETSITTER";
DROP TABLE "MEMBER";
DROP TABLE "BOARD_TYPE";


---------------------------------- 테이블 ---------------------------------------

---------------------------------- 시퀀스 ---------------------------------------

DROP SEQUENCE SEQ_MEMBER_NO ; -- 멤버 넘버 시퀀스
DROP SEQUENCE SEQ_BOARD_NO ; -- 게시판 번호 시퀀스
DROP SEQUENCE SEQ_REPLY_NO ; -- 댓글 번호 시퀀스
DROP SEQUENCE SEQ_BOARD_IMG_NO ; -- 게시판 이미지 번호 시퀀스
DROP SEQUENCE SEQ_PETSITTER_NO ; -- 펫시터 번호 시퀀스
DROP SEQUENCE SEQ_RS_NO; -- 예약 번호 시퀀스
DROP SEQUENCE SEQ_PET_NO; -- 반려견 번호 시퀀스
DROP SEQUENCE SEQ_APPLICATION_NO; -- 신청 번호 시퀀스
DROP SEQUENCE SEQ_AUTH_KEY_NO; -- 이메일 인증 번호 시퀀스 
DROP SEQUENCE SEQ_MESSAGE_NO; -- 메세지 번호 시퀀스
DROP SEQUENCE SEQ_LIVE_NO; -- 라이브 카드 번호 시퀀스
DROP SEQUENCE SEQ_PAY_NO; -- 결제 번호 시퀀스
DROP SEQUENCE SEQ_CHATTING_ROOM_NO; -- 채팅메세지번호 시퀀스
DROP SEQUENCE SEQ_CHATTING_MESSAGE_NO; -- 채팅방번호 시퀀스
DROP SEQUENCE SEQ_REPORT_NO; -- 신고번호 시퀀스
DROP SEQUENCE SEQ_LIVE_IMG_NO; -- 라이브카드 이미지번호 시퀀스
COMMIT;
---------------------------------- 시퀀스 ---------------------------------------