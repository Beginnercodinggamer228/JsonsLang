import java.util.Random;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите имя - ");
        String username = scanner.nextLine();
        scanner.close();

        String password = generatePassword(10, 20);
        Data datafile = new Data(username, password, true);

        writeDataToFile("File", "json", datafile);
    }

    public static String generatePassword(int min, int max) {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        int length = random.nextInt(max - min + 1) + min;

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(chars.length());
            sb.append(chars.charAt(index));
        }

        return sb.toString();
    }

    public static void writeDataToFile(String fileName, String fileExtension, Data datafile) {
        try (FileWriter writer = new FileWriter(fileName + "." + fileExtension)) {
            writer.write(datafile.toString());
        } catch (IOException e) {
            System.err.println("Error writing to file: " + e.getMessage());
        }
    }

    public static class Data {
        private String username;
        private String password;
        private boolean iflogin;

        public Data(String username, String password, boolean iflogin) {
            this.username = username;
            this.password = password;
            this.iflogin = iflogin;
        }

        @Override
        public String toString() {
            return "{\"username\":\"" + username + "\",\"password\":\"" + password + 
                   "\",\"iflogin\":" + iflogin + "}";
        }
    }
}