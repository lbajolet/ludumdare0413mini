import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.Socket;


public class Surrogate implements Runnable{
	
	
	private BufferedReader readerIn;
	private PrintStream printOut;
	private Socket _socket;
	
	
	public Surrogate(Socket socket)
	{
		_socket = socket;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		try
		{
			readerIn = new BufferedReader(new InputStreamReader(
					_socket.getInputStream()));
			printOut = new PrintStream(_socket.getOutputStream());
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
			_socket.close();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
	

	private void out(String str) {
		System.out.println(str);
	}

}
