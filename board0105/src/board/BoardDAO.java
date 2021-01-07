package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

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
	
	// 총갯수 구하기
	public int boardCount() throws SQLException{
		int cnt =0;
		Connection c =null;
		PreparedStatement p =null;
		ResultSet r = null;
		String query="";
		
		try {
			c = pool.getConnection();
			query = "SELECT count(*) from "+board;
			p=c.prepareStatement(query);
			r=p.executeQuery(query);
			r.next();
			cnt=r.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("boardCount Exception : "+e);
		}finally {
			r.close();
			p.close();
			pool.releaseConnection(c);
		}
		return cnt;
	}//boardCount()
	
	// 게시글 리스트 가져오기
	public ArrayList getBoardList() throws SQLException{ //Vector , ArrayList
		Connection c= null;
		PreparedStatement p = null;
		ResultSet r = null;
		String query ="";
		ArrayList boardList = new ArrayList();
		try {
			c = pool.getConnection();
			query ="select * from "+board+" order by idx asc ";
			p=c.prepareStatement(query);
			r=p.executeQuery(query);
			while(r.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setIdx(r.getInt("idx"));
				boardDTO.setName(r.getString("name"));
				boardDTO.setEmail(r.getString("email"));
				boardDTO.setTitle(r.getString("title"));
				boardDTO.setContent(r.getString("content"));
				boardDTO.setWrite_date(r.getString("write_date"));
				
				boardList.add(boardDTO);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("getBoardList Exception "+e);
		}finally {
			r.close();
			p.close();
			pool.releaseConnection(c);
		}
		return boardList;
	}//getBoardList
	
	//글 보기 content
	public BoardDTO boardView(int idx) throws SQLException{
		Connection c=null;
		PreparedStatement p = null;
		ResultSet r = null;
		String query = null;
		BoardDTO boardDTO = new BoardDTO();
		
		try {
			c = pool.getConnection();
			query="select * from "+board+" where idx="+idx;
			p=c.prepareStatement(query);
			r=p.executeQuery(query);
			if(r.next()) {
				boardDTO.setIdx(r.getInt("idx"));
				boardDTO.setName(r.getString("name"));
				boardDTO.setEmail(r.getString("email"));
				boardDTO.setTitle(r.getString("title"));
				boardDTO.setContent(r.getString("content"));
				boardDTO.setWrite_date(r.getString("write_date"));
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("boardView Exception" + e);
		}finally {
			r.close();
			p.close();
			pool.releaseConnection(c);
		}
		return boardDTO;
	}// boardView
	
	
	// 암호 확인을 위한 패스워드 확인
	public boolean passwordcheck(int idx,String pwd) throws SQLException{
		Connection c =null;
		PreparedStatement p =null;
		ResultSet r = null;
		
		String query = "";
		String pwd2 = "";
		boolean check = false;
		
		try {
			c=pool.getConnection();
			query="SELECT password from "+board+" where idx="+idx;
			System.out.println(query);
			p=c.prepareStatement(query);
			r=p.executeQuery(query);
			
			r.next();
			
			pwd2=r.getString(1);
			pwd=pwd.trim(); //입력 폼 공란 제거
			pwd2=pwd2.trim(); // DB 암호 공란 제거
			
			if(pwd.equals(pwd2)) { // 암호 일치시
				check=true;
			}else {
				check=false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("passwordcheck Exception :"+e);
		}finally {
			r.close();
			p.close();
			pool.releaseConnection(c);
		}
		
		return check;
	}// passwordcheck
	
	// 수정처리
	public boolean Update(BoardDTO boardDTO) throws Exception{
		Connection c= null;
		//PreparedStatement p =null;
		Statement s= null;
		String query= "";
		
		boolean flag = false;
		
		int idx=boardDTO.getIdx();
		String pwd = boardDTO.getPassword();
		String email= boardDTO.getEmail();
		String title = boardDTO.getTitle();
		String content = boardDTO.getContent();
		
		try {
			c = pool.getConnection(); // 제발좀 넣자..;
			s=c.createStatement();
			if(passwordcheck(idx, pwd)) {
				
				//query = "UPDATE "+board+" SET email= ? , title = ? , content = ? where idx= "+idx;
				query = "Update "+board+" SET email = '"+email+"', title='"+title+"', content='"+content+"' where idx ="+idx;
				s.executeUpdate(query);
				
				//p=c.prepareStatement(query);
				//p.setString(1, boardDTO.getEmail());
				//p.setString(2, boardDTO.getTitle());
				//p.setString(3, boardDTO.getContent());
				
				//p.executeUpdate();
				System.out.println(query);
				flag=true;
			}else {
				flag=false;
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("Update Exception"+e);
		}finally {
			//p.close();
			s.close();
			pool.releaseConnection(c);
		}
		return flag;
		
	}//update
	
	//글 삭제
	public boolean boardDelete(int idx,String pwd) throws SQLException{
		Connection c= null;
		//PreparedStatement p = null;
		Statement s =null;
		String query = "";
		boolean check =false;
		try {
			c=pool.getConnection();
			s=c.createStatement();
			if(passwordcheck(idx, pwd)) {
				
				query="delete from "+board+" where idx="+idx;
				s.executeUpdate(query);
				//p=c.prepareStatement(query);
				//p.executeUpdate();
				check=true;
			}else {
				check =false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("boardDelete Exception" +e);
		}finally {
			//p.close();
			s.close();
			pool.releaseConnection(c);
		}
		return check;
	}//boardDelete
	
	
	// 검색글 총갯수
	public int boardCount(String type,String search) throws SQLException{
		Connection c = null;
		PreparedStatement p = null;
		ResultSet r = null;
		String query = "";
		int cnt =0;
		
		try {
			c= pool.getConnection();
			query="SELECT count(*) from "+board+" where "+type+" like "+"'%"+search+"%'";
			p=c.prepareStatement(query);
			r=p.executeQuery(query);
			System.out.println(query);
			r.next();
			cnt=r.getInt(1);
			System.out.println(cnt);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("boardCount Exception :" +e);
		}finally {
			r.close();
			p.close();
			pool.releaseConnection(c);
		}
		return cnt;
	}
	
	// 검색글 리스트 가져오기
	public ArrayList getSearchList(String type,String search) throws SQLException{
		Connection c= null;
		PreparedStatement p = null;
		ResultSet r= null;
		String query = "";
		ArrayList searchList = new ArrayList();
		try {
			c=pool.getConnection();
			query = "Select * from "+board+ " where "+type+" like '%"+search+"%' order by idx desc";
			p=c.prepareStatement(query);
			r=p.executeQuery(query);
			
			while(r.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setIdx(r.getInt("idx"));
				boardDTO.setName(r.getString("name"));
				boardDTO.setEmail(r.getString("email"));
				boardDTO.setTitle(r.getString("title"));
				boardDTO.setContent(r.getString("content"));
				boardDTO.setWrite_date(r.getString("write_date"));
				
				searchList.add(boardDTO);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("getSearchList Exception : "+e);
		}finally {
			r.close();
			p.close();
			pool.releaseConnection(c);
		}
		return searchList;
	}// getSearchList

	
	
	
	
	
	

}
