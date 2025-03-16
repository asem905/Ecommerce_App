class AppLink{
  static const String server="http://192.168.1.12:8012/ecommerce/";
  //users
  static const String test="$server/test.php";
  //iamge
  static const String imagestatic="http://192.168.1.12:8012/ecommerce/upload";
  static const String imagecategories="$imagestatic";
  static const String imageitems="$imagestatic";
  //auth
  static const String signUp="$server/auth/signup.php";
  static const String Login="$server/auth/login.php";
  static const String VerifyCodeSignup="$server/auth/verifycode.php";
  static const String resendCodeSignup="$server/auth/resend.php";
  //forgetpassword
  static const String checkemail="$server/auth/forgetpassword/checkemail.php";
  static const String resetpassword="$server/auth/forgetpassword/resetpassword.php";
  static const String VerifyCodeForgetpassword="$server/auth/forgetpassword/verifycode.php";
  //home
  static const String homepage="$server/home.php";
  //items
  static const String items="$server/items/items.php";
  static const String searchitems="$server/items/search.php";
  static const String favouriteAdd="$server/favorites/add.php";
  static const String favouriteRemove="$server/favorites/remove.php";
  static const String favouriteview="$server/favorites/view.php";
  static const String deletefromfavpage= "$server/favorites/deletefromfavpage.php";
  static const String cartAdd="$server/cart/add.php";
  static const String cartRemove="$server/cart/remove.php";
  static const String cartCount="$server/cart/getcountitems.php";
  static const String cartview="$server/cart/view.php";
}