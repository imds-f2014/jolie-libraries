import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import jolie.runtime.JavaService;
import jolie.runtime.Value;
import jolie.runtime.embedding.RequestResponse;

public class HashTextTest extends JavaService{

	/**
	 * @param args
	 * @throws NoSuchAlgorithmException 
	 */
	

	public HashTextTest() {
		super();
	}



	@RequestResponse
	public String sha(Value input) /* throws NoSuchAlgorithmException*/ {
		String stringInput = input.getFirstChild("sha").strValue();
		try {
		MessageDigest mDigest = MessageDigest.getInstance("SHA1");
		byte[] result = mDigest.digest(stringInput.getBytes());
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < result.length; i++) {
			sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
		}

		return sb.toString();
		} catch (Exception e) {
			return "lol";
		}
	}
}
