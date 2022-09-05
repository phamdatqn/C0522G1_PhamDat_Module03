package common;

public class Validation {
    private static String regexEmail = "^[a-zA-Z][.\\w]{7,}@[a-z]{2,9}([.][a-z]{2,3}){1,2}$";
    private static String regexName = "^([A-ZỲỌÁẦẢẤỜỄÀẠẰỆẾÝỘẬỐŨỨĨÕÚỮỊỖÌỀỂẨỚẶÒÙỒỢÃỤỦÍỸẮẪỰỈỎỪỶỞÓÉỬỴẲẸÈẼỔẴẺỠƠÔƯĂÊÂĐ]" +
            "[a-zỳọáầảấờễàạằệếýộậốũứĩõúữịỗìềểẩớặòùồợãụủíỹắẫựỉỏừỷởóéửỵẳẹèẽổẵẻỡơôưăêâđ]{1,6}[ ]){1,3}" +
            "([A-ZỲỌÁẦẢẤỜỄÀẠẰỆẾÝỘẬỐŨỨĨÕÚỮỊỖÌỀỂẨỚẶÒÙỒỢÃỤỦÍỸẮẪỰỈỎỪỶỞÓÉỬỴẲẸÈẼỔẴẺỠƠÔƯĂÊÂĐ]" +
            "[a-zỳọáầảấờễàạằệếýộậốũứĩõúữịỗìềểẩớặòùồợãụủíỹắẫựỉỏừỷởóéửỵẳẹèẽổẵẻỡơôưăêâđ]{0,6})$";
    private static String regexCard = "^[0-9]{12}|[0-9]{9}$";
    private static String regexPhoneNumber = "^((\\(\\+84\\-\\))|0)(90|91)[0-9]{7}$";


    public static boolean checkEmail(String email) {
        return email.matches(regexEmail);
    }
    public static boolean checkPhoneNumber(String phoneNumber) {
        return phoneNumber.matches(regexPhoneNumber);
    }

    public static boolean checkCard(String card) {
        return card.matches(regexCard);
    }

    public static boolean checkName(String name) {
        return name.matches(regexName);
    }
}
