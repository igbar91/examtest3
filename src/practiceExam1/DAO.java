package practiceExam1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DAO {

	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public void getConnection() {
		
		
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/oracle");
			conn = ds.getConnection();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		}
		
	
	//classWrite
	//데이터 입력
	public void inputList(BoardInfoBean bean) {
		
		getConnection();
		
		
		try {
			String sql = "insert into course_tbl values(course_seq.nextval, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			//데이터 넣을 떄는 rs필요없음  rs를 정의하지않으니까
				
				pstmt.setString(1, bean.getName());
				pstmt.setInt(2, bean.getCredit());
				pstmt.setString(3, bean.getLecturer());
				pstmt.setInt(4, bean.getWeek());
				pstmt.setInt(5, bean.getStart_hour());
				pstmt.setInt(6, bean.getEnd_end());
				
				pstmt.executeUpdate();
				
			
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	//classList
	//*데이터를 꺼내려면 DAO에 데이터가 먼저 입력되어 있어야됨.
	public Vector<BoardInfoBean> getList(){
		
	
		Vector<BoardInfoBean> vec = new Vector<BoardInfoBean>();
		getConnection();
		
		try {
			
		String sql = "select id, name, credit, lecturer, week, start_hour, end_end from course_tbl order by id asc";
		pstmt = conn.prepareStatement(sql);
		//*출력할 땐 쿼리실행해서 데이터 가져오기 
		rs = pstmt.executeQuery();
		while(rs.next()) {
	
			 BoardInfoBean bean = new BoardInfoBean();
			
			//자바빈에서 가져온 걸 저장한다음 
			//pstmt의 내용을 rs에 저장. 
			//그걸 다시 자바빈에 담음. 
			
			bean.setId(rs.getString(1));
			bean.setName(rs.getString(2));
			bean.setCredit(rs.getInt(3));
			bean.setLecturer(rs.getString(4));
			bean.setWeek(rs.getInt(5));
			bean.setStart_hour(rs.getInt(6));
			bean.setEnd_end(rs.getInt(7));
		
			//*배열객체에 자바빈 추가 
			vec.add(bean);
			
		}
			conn.close();
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
			return vec;
			
	}
		
		//하나의 아이디에 해당하는 정보 불러오기
		//classUpdate.jsp
		public BoardInfoBean bringId(String id) {
		
			BoardInfoBean bean = new BoardInfoBean();
			getConnection();
			
			try {
			
			String sql = "select * from course_tbl where id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				bean.setId(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setCredit(rs.getInt(3));
				bean.setLecturer(rs.getString(4));
				bean.setWeek(rs.getInt(5));
				bean.setStart_hour(rs.getInt(6));
				bean.setEnd_end(rs.getInt(7));
				
				
			}
			
			conn.close();
			
			}catch(Exception e) {
				
				e.printStackTrace();
			}
			
			return bean;
			
		}
	
		//수정한 데이터 저장하기
		//classUpdateAction.jsp
		
		public void saveUpdate(BoardInfoBean bean) {
			
			getConnection();
			
			try {
				
				String sql = "update course_tbl set name=?, credit=?, lecturer=?, week=?, start_hour=?, end_end=? where id = ?";
				pstmt = conn.prepareStatement(sql);
			   				
				pstmt.setString(1, bean.getName());
				pstmt.setInt(2, bean.getCredit());
				pstmt.setString(3, bean.getLecturer());
				pstmt.setInt(4, bean.getWeek());
				pstmt.setInt(5, bean.getStart_hour());
				pstmt.setInt(6, bean.getEnd_end());
				//where절에 있는 id도 세팅 다시 해줘야됨
				pstmt.setString(7, bean.getId());
				pstmt.executeUpdate();
				
				conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}			
		}
		
		
	/*	
		//classWrite
		//데이터 입력
		public void dateLecture(LectureBean tbean) {
			
			getConnection();
			
			
			try {
				String sql = "insert into lecturer_tbl values(lecturer_seq.nextval, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				
				//데이터 넣을 떄는 rs필요없음  rs를 정의하지않으니까
					pstmt.setString(1, tbean.getName());
					pstmt.setString(2, tbean.getMajor());
					pstmt.setString(3, tbean.getField());
					
					pstmt.executeUpdate();
				
				conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
		}
    */   
		//LecturerInfo.jsp
		public LectureBean lecturerInfo(String name) {
			
			
			getConnection();
			LectureBean tbean = new LectureBean();
			try {
				String sql = "select * from lecturer_tbl where name = ?";
				//***** 순서 바뀌면 nullException 에러남.
				// 먼저 > pstmt = conn.prepareStatement(sql);
				// 두번째 > pstmt.setString(1, name);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
				tbean.setIdx(rs.getInt(1));	
				tbean.setMajor(rs.getString(2));
				tbean.setField(rs.getString(3));
				tbean.setName(rs.getString(4));
					
					
				}
				conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return tbean;
		}
		

	 public void deleteInfo(String id) {
		 
		 getConnection();
		 
		 try {
			 
			 String sql = "delete from course_tbl where id = ? ";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1,  id);
			 pstmt.executeUpdate();
			 conn.close();
			 
			 
			 
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 
		 
		 
		 
	 }



}//end



		