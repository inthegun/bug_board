package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import pool.ConnectionPool;

public class BoardDAO {
	
	String board ="or_board"; //테이블명
	String idx="board_idx.nextval"; // 시퀀스명
	ConnectionPool pool=  null;
	
	public BoardDAO() {
		// TODO Auto-generated constructor stub
		try {
			pool=ConnectionPool.getInstance();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("연결실패");
		}
	}// BoardDAO
	
	// 게시글 넣기
	public void boardInsert(BoardDTO boardDTO) throws SQLException{
		Connection c =null;
		//Statement s =c.createStatement();  
		PreparedStatement p = null;
		String query = "";
		try {
			c = pool.getConnection();
			query= "INSERT INTO "+board+" values("+idx+",?,?,?,?,?,to_char(sysdate),0)";
			p=c.prepareStatement(query);
			p.setString(1, boardDTO.getName());
			p.setString(2, boardDTO.getEmail());
			p.setString(3, boardDTO.getTitle());
			p.setString(4, boardDTO.getContent());
			p.setString(5, boardDTO.getPassword());
			
			//s.execute(query)
			p.executeUpdate();
			System.out.println("글 입력 완료 ");
		}catch(Exception e) {
			System.out.println("boardInsert Exception :" +e);
		}finally {
			p.close();
			pool.releaseConnection(c);
		}
		
		
	}//boardInsert
	
	

}
