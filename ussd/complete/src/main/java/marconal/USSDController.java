package marconal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RestController
public class USSDController {

    public static String ourShortCode = "*111#";
    public static final Logger log = LoggerFactory.getLogger(USSDController.class);

    @RequestMapping("/")
    public String index(@RequestParam (name = "USSD_STRING") String body,
                        @RequestParam (name = "MSISDN") String phoneNumber,
                        @RequestParam (name = "serviceCode") String serviceCode,
                        @RequestParam (name = "SESSION_ID", required = false) String sessionId) {


        log.debug("USSD=[%s], MSISDN=[%s],serviceCode=[%s],SESSION_ID=[%s]",
                body,phoneNumber,serviceCode,sessionId);

        // Spring handles required and optional fields.
        // Service code is our short code number
        if( !serviceCode.equals(ourShortCode) ) {
            log.debug("INVALID SHORTCODE: %s != %s",serviceCode, ourShortCode);
            // TODO: instrument
            return String.format("Bad request: serviceCode of %s does not match required value of %s",
                                serviceCode, ourShortCode);
        }

        // Look for our code in the body. If it doesn't exist, then ask the user for it and return.
        String redemptionCode = getRedemptionCode(body);
        if( redemptionCode == null ) {
            // Note the failed request for DOS / Random guess attacks.
            return "CON Welcome to Marconal Prepaid!\\nPlease enter your redemption code. END";
        }

        // Valid redemption code format has been found.
        // Credit the phone number's account if it exists.
        // Otherwise notify the user of an invalid or redeemed code.
        int creditedAmount = 0;
        try {
            creditedAmount = applyRedemptionCode(phoneNumber,redemptionCode);
        } catch( Exception e ) {
            log.error("Failed redemption: ", e);
            // TODO: instrument
            return "CON Sorry, this service is unavailable right now. Please try again later. END";
        }

        if( creditedAmount <= 0 ) {
            return "CON This code is invalid or has already been redeemed. Please try again. EMD";
        }

        // Amount was credited to their phone. Notify the user.
        return "CON A credit of %d birr has been applied to your phone number (%s).\n\n"
                + "Thank you for using Marconal Prepaid! END";
    }

    public int applyRedemptionCode(String phoneNumber, String redemptionCode) throws Exception {
        // TODO: Move to a database instead of a hashtable.

        return 0;
    }


    public String getRedemptionCode(String body) {
        if (body == null) return null;

        // assume a 10 digit redemption code.
        String regex = "@\"(?<!\\d)\\d{10}(?!\\d)\""; // @"(?<!\d)\d{10}(?!\d)".
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(body);

        String redemptionCode = matcher.group();

        return redemptionCode;
    }

}
