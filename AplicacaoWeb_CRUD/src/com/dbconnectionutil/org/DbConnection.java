package com.dbconnectionutil.org;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {

		static String HOST = "jdbc:mysql://localhost/aplicacao_crud_db";

		static String USER = "Lucas Bruce";

		static String PASSWORD = "1996.,.2017";

		static Connection conn = null;
		
		public static Connection getConnection(){
			
			try{

			    Class.forName("com.mysql.jdbc.Driver");
			     
			    conn = DriverManager.getConnection(HOST, USER, PASSWORD);

			    System.out.println("Conectado com sucesso ... No banco de dados!");

			}
			catch(Exception ex){
			     ex.printStackTrace();
			}
		return conn;
		}
}






