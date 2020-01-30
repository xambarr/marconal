package marconal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;
import java.util.Hashtable;


public class RedemptionCode {

    public static final Logger log = LoggerFactory.getLogger(RedemptionCode.class);
    public static final int length = 10; // length of the redemption code

    public int birrValue = 0;
    public String code = null;
    public Date redeemedDate = null;


    public RedemptionCode(String code, int birrValue) {
        this.code = code;
        this.birrValue = birrValue;
        this.redeemedDate = null; // newly created redemption code
    }

}
