package csdit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PJ2020DAO {
	private static PJ2020DAO instance = new PJ2020DAO();
	
	public static PJ2020DAO getInstance() {
		return instance;
	}
	//커넥션 풀 내용.
	private Connection getConnection() throws Exception{
		Connection con = null;
		
		try {	
		//1. Context 객체 얻기
		Context initCtx = new InitialContext();

		//2. "java:comp/env" 에 해당하는 객체를 찾아서 envCtx에 삽입
		Context envCtx = (Context) initCtx.lookup("java:comp/env");

		//3. "jdbc/animal"에 해당하는 개체를 찾아서 ds에 삽입
		DataSource ds = (DataSource) envCtx.lookup("jdbc/animal");
		
		//4. 커넥션 풀로 부터 커넥션 객체를 얻어냄
		con = ds.getConnection();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	//입력/변경/삭제 함수.
	public void WRITERChange(WRITERDTO dto, String flag) {
		Connection con = null; PreparedStatement pstmt = null;
		String sql=null; ResultSet rs = null;
		try { 
			con = getConnection();
			if(flag.equals("i")) {
				sql = "INSERT INTO WRITER VALUES(?,?,?)";		
				//3.sql문 준비
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPwd());
				pstmt.setString(3, dto.getName());
			}else if(flag.equals("u")) {
				sql = "update WRITER set U_NAME=?, U_PW=? where U_ID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getPwd());
				pstmt.setString(3, dto.getId());
				pstmt.executeUpdate();
			}else if(flag.equals("d")) {
				sql = "delete from WRITER where U_ID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.executeUpdate();
			}
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	//자유게시판
	//입력/변경/삭제 함수.
		public void F_BOARD_Change(BOARD_FDTO dto, String flag) {
			Connection con = null; PreparedStatement pstmt = null;
			String sql=null; ResultSet rs = null;
			try { 
				con = getConnection();
				if(flag.equals("i")) {
					sql = "INSERT INTO BOARD_F VALUES(SEQ_ID.NEXTVAL, ?, ?, ?, ?)";		
					//3.sql문 준비
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getF_TITLE());
					pstmt.setString(2, dto.getF_DATE());
					pstmt.setString(3, dto.getF_CONTENT());
					pstmt.setString(4, dto.getU_ID());
				}else if(flag.equals("u")) {
					sql = "update BOARD_F set F_TITLE=?, F_DATE=? ,F_CONTENT=? where F_NUM=?";//수정시 날짜 변경 허용?
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getF_TITLE());
					pstmt.setString(2, dto.getF_DATE());
					pstmt.setString(3, dto.getF_CONTENT());
					pstmt.setInt(4, dto.getF_NUM());
					pstmt.executeUpdate();
				}else if(flag.equals("d")) {
					sql = "delete from BOARD_F where F_NUM=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, dto.getF_NUM());
					pstmt.executeUpdate();
				}
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		//list 자유게시판
				public ArrayList<BOARD_FDTO> list_F(){
					//db검색정보 저장위해 arraylist생성
					ArrayList<BOARD_FDTO> dtos = new ArrayList<BOARD_FDTO>();
						Connection con=null;
						Statement stmt = null;
						ResultSet rs = null;
						
						try {
							con = getConnection();
							String sql= "select * from BOARD_F ORDER BY F_DATE";
							stmt = con.createStatement();
							rs = stmt.executeQuery(sql);
							
							while(rs.next()) {
								int num = rs.getInt("F_NUM");
								String title = rs.getString("F_TITLE");
								String date = rs.getString("F_DATE");
								String content = rs.getString("F_CONTENT");
								String writer = rs.getString("U_ID");
								BOARD_FDTO dto = new BOARD_FDTO(num, title, date, content, writer);
								dtos.add(dto);
							}
						}catch(Exception e) {
							e.printStackTrace();
						}finally {
							try { 
								if(rs!=null) rs.close();
								if(stmt!=null)stmt.close();
								if(con!=null) con.close();
							}catch(Exception e){e.printStackTrace();}
						}	
						return dtos;
				}
				//listUser
				public ArrayList<WRITERDTO> listUser(){
					//db검색정보 저장위해 arraylist생성
					ArrayList<WRITERDTO> dtos = new ArrayList<WRITERDTO>();
						Connection con=null;
						Statement stmt = null;
						ResultSet rs = null;
						
						try {
							con = getConnection();
							String sql= "select * from WRITER ORDER BY U_ID";
							stmt = con.createStatement();
							rs = stmt.executeQuery(sql);
							
							while(rs.next()) {
								String id = rs.getString("U_ID");
								String pwd = rs.getString("U_PW");
								String name = rs.getString("U_NAME");
								WRITERDTO dto = new WRITERDTO(id, pwd, name);
								dtos.add(dto);
							}
						}catch(Exception e) {
							e.printStackTrace();
						}finally {
							try { 
								if(rs!=null) rs.close();
								if(stmt!=null)stmt.close();
								if(con!=null) con.close();
							}catch(Exception e){e.printStackTrace();}
						}	
						return dtos;
				}
		//updateUser
		public void updateUser(String id, String name, String pwd)throws Exception{
			
			Connection con = null;
			PreparedStatement pstmt=null;
			try {
				con = getConnection();
				String sql = "update login set name=?, pwd=? where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, pwd);
				pstmt.setString(3, id);
				pstmt.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				}catch(Exception e) {e.printStackTrace();}
			}
		}
		//deleteUser
		public void deleteUser(String id)throws Exception{
			
			Connection con = null;
			PreparedStatement pstmt=null;
			try {
				con = getConnection();
				String sql = "delete from login where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				}catch(Exception e) {e.printStackTrace();}
			}
		}
	
}
















