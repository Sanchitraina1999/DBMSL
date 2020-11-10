package b6;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
public class filename {
	public static void main(String[] args) throws JSONException
	{
		//created JSON object
		JSONObject ob = new JSONObject();
		ob .put( "ID" , 1);
		ob .put( "NAME" , "Abhi" );
		ob .put( "ADDRESS" , "Satara" );
		ob .put( "AGE" , 20);
		
		System.out.println("JSON Object: "+ ob );
		
		System.out.println();
		
		//Creating JSON Array
		JSONArray A = new JSONArray();
		ob .put( "COURSE" , A );
		System.out.println("JSON Array: " + ob);
		A .put( "COMP" );
		System.out.println("JSON Array: " + ob);
		A .put( "IT" );
		System.out.println("JSON Array: " + ob);
		A .put( "MECH" );
		System.out.println("JSON Array: " + ob);
		A .put( "E & TC" );
		System.out.println("JSON Array: " + ob);
	}
}