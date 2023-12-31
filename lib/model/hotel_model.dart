// data_provider.dart

class DataHotel {
  static List<Map<String, String>> whyKlook() {
    return [
      {
        'img': 'img/money_travel.webp',
        'title': 'Ưu đãi đặc biệt',
        'content':
            'Nhận mức giá hấp dẫn và tìm những deal khuyến mãi phù hợp với bạn.',
      },
      {
        'img': 'img/customer_service.webp',
        'title': 'Hỗ trợ khách hàng 24/7',
        'content': 'Chúng tôi luôn có mặt ở đây khi bạn cần.',
      },
      {
        'img': 'img/top_rate.webp',
        'title': 'Nền tảng du lịch One-stop',
        'content':
            'Dịch vụ của chúng tôi hỗ trợ 23 ngôn ngữ và 42 loại tiền tệ cùng đa dạng phương thức thanh toán.',
      },
    ];
  }

  static List<Map<String, String>> bookingFAQs() {
    return [
      {
        'question': 'Làm cách nào để đặt phòng trên Klook?',
        'answer': 'Đăng nhập vào tài khoản Klook của bạn hoặc tạo một tài khoản. '
            'Chọn Khách sạn từ menu chính, nhập điểm đến và ngày của bạn sau đó nhấn tìm kiếm. '
            'Chọn một chỗ ở và hoàn thành đặt phòng. '
            'Bạn sẽ nhận được email xác nhận trong vòng 30 phút sau khi đặt phòng.',
      },
      {
        'question': 'Tôi có thể tìm thấy chính sách hủy ở đâu?',
        'answer':
            'Bạn có thể tìm thấy chính sách của phòng bên dưới "Huỷ miễn phí" hoặc "Không hoàn tiền" gần giá phòng. Để tìm hiểu thêm chi tiết, hãy đến trang đặt phòng. Nếu bạn đã đặt chỗ, bạn có thể tìm thấy chi tiết chính sách hủy trong email xác nhận. Xin lưu ý rằng chính sách hủy thay đổi tùy theo chỗ ở. Vui lòng kiểm tra chính sách của khách sạn trước khi đặt phòng.',
      },
      {
        'question': 'Làm thế nào để biết đặt phòng của tôi được xác nhận?',
        'answer':
            'Chúng tôi sẽ gửi email xác nhận với chi tiết đặt phòng của bạn trong vòng 30 phút sau khi bạn thanh toán. Nếu bạn không thể tìm thấy email, hãy thử kiểm tra thư mục spam/thư rác. Bạn cũng có thể kiểm tra "Đơn hàng của tôi" trên ứng dụng hoặc website Klook.',
      },
      {
        'question': 'Tôi có bị tính phí nếu tôi hủy đặt phòng không?',
        'answer':
            'Điều này phụ thuộc vào chính sách hủy đặt phòng của bạn. Nếu bạn huỷ các đặt phòng không hoàn tiền có thể sẽ bị tính phí toàn bộ giá trị đặt phòng. Hủy miễn phí nghĩa là bạn có thể huỷ đặt phòng trong một khoảng thời gian nhất định. Ví dụ: một số chỗ ở cho phép bạn hủy 48 giờ trước khi nhận phòng. Ngoài thời gian cho phép, bất kỳ yêu cầu hủy nào cũng có thể bị tính phí. Vui lòng xem chính sách hủy của chỗ ở để biết thêm chi tiết.',
      },
    ];
  }
}
