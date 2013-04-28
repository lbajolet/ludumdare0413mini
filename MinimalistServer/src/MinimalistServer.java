import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class MinimalistServer {

	private static MinimalistServer instance_;
	private static Object syncObject_;
	private int _port = 8080;
	private ServerSocket serverSocket;
	private Socket incoming;
	private BufferedReader readerIn;
	private PrintStream printOut;
	private static MinimalistServer server;
	
	
	private List<Socket> _sockets = new ArrayList<Socket>();
	private List<Runnable> _surrogates = new ArrayList<Runnable>();
	private List<Thread> _threads = new ArrayList<Thread>();
	
	public static void main(String[] args)
    {
        int port = 8080;
        server = new MinimalistServer(port);
    }

	 private MinimalistServer() {
		   
		  }
	
	private MinimalistServer(int port) {
		this._port = port;
		System.out.println("Starting the Server on port : " + port);
		try {
			serverSocket = new ServerSocket(port);
			//méthode blocante
			//incoming = serverSocket.accept();
			//while the application is running
			//any new requests are accepted and stored
			Socket tmpSocket = null;
			while (true)
			{
				tmpSocket = serverSocket.accept();
				_sockets.add(tmpSocket);
				Runnable r = new Surrogate(tmpSocket);
				_surrogates.add(r);
				Thread t = new Thread(r);
				_threads.add(t);
				t.start();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	} 
	
	 public static MinimalistServer getInstance() {

		    /* in a non-thread-safe version of a Singleton   */
		    /* the following line could be executed, and the */ 
		    /* thread could be immediately swapped out */
		    if (instance_ == null) {

		      synchronized(syncObject_) {

		        if (instance_ == null) {
		           instance_ = new MinimalistServer();
		        }

		      }

		    }
		    return instance_;
		  }
}
