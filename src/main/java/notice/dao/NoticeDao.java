package notice.dao;

import java.sql.*;

import notice.db.DBCon;
import notice.vo.Notice;

public class NoticeDao { //Date access object DB와 접속해서 처리

	public int insert(Notice n) throws Exception {
		
		Connection conn = DBCon.getConnection(); 
		//DBCon에서 DB접속 내용을 리턴 받아와서 DB접속처리!  
		
		//접속성공

		String sql = "insert into notices(seq,title,writer,content,regdate,hit) " 
		+"values ((select max(to_number(seq))+1 from notices),?,'park',?,sysdate,0)";
	  
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, n.getTitle());
		pstmt.setString(2, n.getContent());
		
		//실행
		int cnt = pstmt.executeUpdate(); //insert 실행
		
		pstmt.close();
		conn.close();
		return cnt;
	}
	
	
	public int delete(String seq) throws Exception {
		
		Connection conn = DBCon.getConnection();
		//접속성공
		
		//String sql ="select * from notices where seq="+seq;
		String sql ="delete from notices where seq=?";
		
		//Statement st = conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		
		//ResultSet rs = st.executeQuery(sql); //statement형식 select 실행

		int af=pstmt.executeUpdate(); //delete실행
		
		return af;
	}
	
	
	public int update(Notice notice) throws Exception {
		
		Connection conn = DBCon.getConnection();
		
		//접속성공
		//String sql ="select * from notices where seq="+seq;
		String sql ="update notices set title=?,content=? where seq=?";
		
		//Statement st = conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getSeq());
		
		//ResultSet rs = st.executeQuery(sql); //statement형식 select 실행
		int cnt = pstmt.executeUpdate();  //pstmt형식 update실행
		return cnt;
	}
	
	
	
	
	public Notice getNotice(String seq) throws Exception {
		
		Connection conn = DBCon.getConnection();
		
		//접속성공
		
		
		//String sql ="select * from notices where seq="+seq;
		String sql ="select * from notices where seq=?";
		
		//Statement st = conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		
		//ResultSet rs = st.executeQuery(sql); //statement형식 select 실행
		ResultSet rs = pstmt.executeQuery();  //pstmt형식 실행
		rs.next();
		
		//db의 select 결과를 Notice파일에 저장
		//noticeDetail.jsp의 tbody쪽 rs.로 받는 값들을 n으로 보내줌
		Notice n = new Notice();
		n.setSeq(rs.getString("seq"));
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("writer"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return n;
	}
}
