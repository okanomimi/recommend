import java.io.*;//BufferedReadered用
import java.net.*;//DatagramSocket、InetAddress用

public class UDPSendTest{
	static BufferedReader br = new BufferedReader( new InputStreamReader(System.in) );

	DatagramSocket sendSocket = new DatagramSocket();//UDP送信用ソケット
	InetAddress inetAddress = InetAddress.getByName("127.0.0.1");//送信先
	
	public UDPSendTest() throws Exception {//コンストラクタ
	}
	
	public boolean send() throws Exception {
		System.out.print("msg==>");
    
    String[] test = new String[2] ;
    test[0] = "testet" ;
    test[1] = "kkkkkk" ;
    String e = new String()  ;
    foreach(String t : test){
        e += t ; 
    }
		/* String msg = br.readLine();//送信メッセージキー入力 */
		/* byte []buf = msg.getBytes();//バイト列に変換 */
		byte []buf = t.getBytes();//バイト列に変換
		/* DatagramPacket packet= new DatagramPacket(buf,buf.length, inetAddress, 5431);//IPアドレス、ポート番号も指定 */
		DatagramPacket packet= new DatagramPacket(buf,buf.length, inetAddress, 10000);//IPアドレス、ポート番号も指定
		sendSocket.send(packet);//送信
		if(msg.equals("")){
			return false;//入力文字列なしで終了
		}
		return true;
	}
		
	public static void main(String [] args) throws Exception{
		UDPSendTest test = new UDPSendTest();
		
		while(test.send() == true)//送信の繰り返し
			;
		test.sendSocket.close();
		System.out.print("Press Enter Key");
		br.readLine();
	}
}

