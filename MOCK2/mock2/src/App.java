import com.mongodb.client.*;

import java.util.Scanner;
import org.bson.*;
import org.bson.json.JsonWriterSettings;
import org.json.simple.JSONObject;
import org.json.*;

public class App {
    private static final MongoClient mongoClient;
    private static final MongoDatabase db;
    private static final MongoCollection<Document> collection;
    private static final JsonWriterSettings settings;
    private static final Scanner input;
    public static JSONObject obj = new JSONObject();
    public static JSONArray arr = new JSONArray();

    static {
        input = new Scanner(System.in);
        mongoClient = MongoClients.create("mongodb://localhost:27017");
        db = mongoClient.getDatabase("mock2");
        collection = db.getCollection("Songs");
        settings = JsonWriterSettings.builder().indent(true).build();
    }

    public static void main(String[] args) {
        while (true) {
            System.out.print("\n1.Insert\n" + "2.Find\n" + "3.Exit\n" + "Enter Choice: ");
            int choice = input.nextInt();
            System.out.print("\n");

            switch (choice) {
                case 1:
                    insert();
                    break;
                case 2:
                    find();
                    break;
                case 3:
                    System.exit(0);
            }
        }
    }

    @SuppressWarnings("unchecked")
    public static void insert() {

        System.out.println("ID: ");
        Integer id = input.nextInt();
        obj.put("_id", id);

        System.out.println("Title: ");
        input.nextLine();
        String name = input.nextLine();
        obj.put("title", name);

        System.out.println("Album:");
        String str = input.nextLine();
        obj.put("Album", str);

        System.out.println("Singer:");
        String singer = input.nextLine();
        obj.put("Singer", singer);

        System.out.println("Duration: ");
        String dur = input.nextLine();
        obj.put("Duration", dur);

        System.out.println("Number of likes: ");
        int x = input.nextInt();
        for (int i = 0; i < x; i++) {
            System.out.println("Liked by: ");
            String f = input.next();
            arr.put(f);
        }

        obj.put("LikedBy", arr);
        arr = new JSONArray();
        Document doc = Document.parse(obj.toString());
        collection.insertOne(doc);

    }

    public static void find() {
        for (Document doc : collection.find()) {
            System.out.println(doc.toJson(settings));
        }
    }
}