package sequoiia;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Version {
    public static String getHash() {
        StringBuilder sb = new StringBuilder();
        final ClassLoader contextClassLoader = Thread.currentThread().getContextClassLoader();

        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(contextClassLoader.getResourceAsStream("var/version.txt")));
            // Get first 8 characters of hash.
            for (int i = 0; i < 8; i++) {
                sb.append((char) br.read());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return sb.toString();
    }
}