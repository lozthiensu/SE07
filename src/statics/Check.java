package statics;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

public class Check {
	public static boolean old(String d2) throws java.text.ParseException {

		SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");

		try {
			Date date1 = new Date();
			Date date2 = myFormat.parse(d2);
			Log.in(date1 + " " + date2);
			long diff = date1.getTime() - date2.getTime();
			System.out.println("Days: " + TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS));
			int di = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
			Log.in("So ngay: " + di); 
			if(di > 60){
				Log.in("True");
				return true; 
			}
			Log.in("False");
			return false;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return false;
	}
}
