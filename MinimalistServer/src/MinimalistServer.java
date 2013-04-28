import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class MinimalistServer {

	private int _port = 8080;
	private ServerSocket serverSocket;
	private Socket incoming;
	private BufferedReader readerIn;
	private PrintStream printOut;
	private static MinimalistServer server;
	
	private List<Socket> _sockets = new ArrayList<Socket>();
	
	public static void main(String[] args)
    {
        int port = 8080;
        server = new MinimalistServer(port);
    }

	public MinimalistServer(int port) {
		this._port = port;
		System.out.println("Starting the Server on port : " + port);
		try {
			serverSocket = new ServerSocket(port);
			//méthode blocante
			incoming = serverSocket.accept();
			
			readerIn = new BufferedReader(new InputStreamReader(
					incoming.getInputStream()));
			printOut = new PrintStream(incoming.getOutputStream());
			printOut.println("Enter EXIT to exit.\r");
			out("Enter EXIT to exit.\r");
			boolean done = false;
			while (true) {
				String str = readerIn.readLine();
				
				if (str == null) {
					done = true;
				} else {
					out("Echo: " + str + "\r");
					if (str.trim().equals("EXIT")) {
						done = true;
						break;
					}
				}
			}
			incoming.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	} 

	private void out(String str) {
		System.out.println(str);
	}
}
