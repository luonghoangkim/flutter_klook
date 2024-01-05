import 'package:http/http.dart' as http;

void signUp() async {
  const String apiUrl = "http://localhost:3000/user/sign-in";

  http.Response response = await http.post(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    print("Đăng ký thành công");
  } else {
    print("Đăng ký thất bại. Mã lỗi: ${response.statusCode}");
  }
}
