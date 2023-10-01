package edu.kh.mung.chatting.model.websocket;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import edu.kh.mung.chatting.model.dto.Message;
import edu.kh.mung.chatting.model.service.ChattingService;
import edu.kh.mung.chatting.model.service.ChattingService2;
import edu.kh.mung.member.model.dto.Member;

public class ChattingWebsocketHandler2 extends TextWebSocketHandler{

	// 주요 메소드 4가지
	
	// afterConnectionEstablished (WebSocketSession session) : 클라이언트가 서버로 연결된 이후에 실행
	
	// handleMessage (WebSocketSession session, WebSocketMessage<?> message) : 클라이언트가 서버로 메세지를 전송했을 때 실행
	
	// afterConnectionClosed (WebSocketSession session, CloseStatus status) : 클라이언트가 연결을 끊었을 때 실행
	
	// handleTransportError (WebSocketSession session,Throwable exception) : 연결된 클라이언트에서 예외 발생 시 실행
	
	@Autowired
	private ChattingService2 service;
	
    private Set<WebSocketSession> sessions  = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 연결 요청이 접수되면 해당 클라이언트와 통신을 담당하는 WebSocketSession 객체가 전달되어져 옴.
        // 이를 필드에 선언해준sessions에 저장
        sessions.add(session);
    
        //logger.info("{}연결됨", session.getId());
//      System.out.println(session.getId() + "연결됨");
    }
    
    
    //handlerTextMessage - 클라이언트로부터 텍스트 메세지를 받았을때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        
        // Jackson에서 제공하는 객체
        // JSON String -> VO Object
        ObjectMapper objectMapper = new ObjectMapper();
        
        Message msg = objectMapper.readValue( message.getPayload(), Message.class);
        
        // Message 객체 확인
        System.out.println("이미친놈아 메세지뭔데?"+msg); 
        
        // DB 삽입 서비스 호출
        int result = service.insertMessage2(msg);
        System.out.println("result=="+result);
        if(result > 0 ) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
            msg.setSendTime(sdf.format(new Date()) );
            
            // 전역변수로 선언된 sessions에는 접속중인 모든 회원의 세션 정보가 담겨 있음
            for(WebSocketSession s : sessions) {
                // WebSocketSession은 HttpSession의 속성을 가로채서 똑같이 가지고 있기 때문에
                // 회원 정보를 나타내는 loginMember도 가지고 있음.
                
                // 로그인된 회원 정보 중 회원 번호 얻어오기
                int loginMemberNo = ((Member)s.getAttributes().get("loginMember")).getMemberNo();
                
                // 로그인 상태인 회원 중 targetNo가 일치하는 회원에게 메세지 전달
                if(loginMemberNo == msg.getTargetNo() || loginMemberNo == msg.getSenderNo()) {
                    System.out.println("chattingWeb=="+msg);
                    s.sendMessage(new TextMessage(new Gson().toJson(msg)));
                }
            }
        }
    }
    
    
    
    
    // afterConnectionClosed - 클라이언트와 연결이 종료되면 실행된다.
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
        //logger.info("{}연결끊김",session.getId());
    }
    
}

/* WebSocket
- 브라우저와 웹서버간의 전이중통신을 지원하는 프로토콜이다
- HTML5버전부터 지원하는 기능이다.
- 자바 톰캣7버전부터 지원했으나 8버전부터 본격적으로 지원한다.
- spring4부터 웹소켓을 지원한다. 
(전이중 통신(Full Duplex): 두 대의 단말기가 데이터를 송수신하기 위해 동시에 각각 독립된 회선을 사용하는 통신 방식. 
대표적으로 전화망, 고속 데이터 통신)



WebSocketHandler 인터페이스 : 웹소켓을 위한 메소드를 지원하는 인터페이스
    -> WebSocketHandler 인터페이스를 상속받은 클래스를 이용해 웹소켓 기능을 구현


WebSocketHandler 주요 메소드
        
    void handlerMessage(WebSocketSession session, WebSocketMessage message)
    - 클라이언트로부터 메세지가 도착하면 실행
    
    void afterConnectionEstablished(WebSocketSession session)
    - 클라이언트와 연결이 완료되고, 통신할 준비가 되면 실행

    void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus)
    - 클라이언트와 연결이 종료되면 실행

    void handleTransportError(WebSocketSession session, Throwable exception)
    - 메세지 전송중 에러가 발생하면 실행 


----------------------------------------------------------------------------

TextWebSocketHandler :  WebSocketHandler 인터페이스를 상속받아 구현한 텍스트 메세지 전용 웹소켓 핸들러 클래스
 
    handlerTextMessage(WebSocketSession session, TextMessage message)
    - 클라이언트로부터 텍스트 메세지를 받았을때 실행
     

*/