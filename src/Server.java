import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@EnableAutoConfiguration
public class Server {

    @RequestMapping("/")
    @ResponseBody
    String index(HttpServletRequest request) {
        InetAddress nodeAddress = null;

        String versionHash = "34as71";

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        String fullTimestamp = dateFormat.format(date);
        try {
            nodeAddress = InetAddress.getLocalHost();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        String body = String.format("Response served by<br>§ Node IP: %s<br>§ Client IP: %s<br>§ Server version: %s<br>§ Date: %s",
                nodeAddress.getHostAddress(),
                request.getRemoteAddr(),
                versionHash,
                fullTimestamp);
        return body;
    }

    public static void main(String[] args) {
        SpringApplication.run(Server.class, args);
    }
}