import org.springframework.core.io.ClassPathResource;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Version {
    public static String getHash() {
        StringBuilder sb = new StringBuilder();
        try {
            FileReader fr = new FileReader(new ClassPathResource("version.txt").getFile());
            BufferedReader br = new BufferedReader(fr);
            for (int i = 0; i < 8; i++) {
                sb.append((char) br.read());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return sb.toString();
    }
}