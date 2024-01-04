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

  static List<Map<String, dynamic>> hotelSearch() {
    return [
      {
        'id': '1',
        'name': 'Thành phố Hồ Chí Minh',
        'country': 'Việt Nam',
        'hotels': [
          {
            'images': [
              'img/img_hotel1.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Richico Soho  Boutique  Apartments And Hotel',
            'rating': 4.7,
            'distance': 3.5,
            'amenities': ['Lễ tân 24/24', 'Hỗ trợ tận tình', 'Gần trung tâm'],
            'bookings': 120,
            'pricePerNight': 80.0,
            'availableRooms': 1,
          },
          {
            'images': [
              'img/img_hotel5.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel3.jpeg'
            ],
            'hotelName': 'Khách sạn TP Hồ Chí Minh',
            'rating': 4.2,
            'distance': 2.8,
            'amenities': [
              'WiFi miễn phí',
              'Bể bơi',
              'Nhà hàng trong khuôn viên'
            ],
            'bookings': 90,
            'pricePerNight': 100.0,
            'availableRooms': null,
          },
          {
            'images': [
              'img/img_hotel4.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel1.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Khách sạn Sài Gòn',
            'rating': 5.0,
            'distance': 4.0,
            'amenities': ['Phòng gym', 'Dịch vụ phòng 24/24', 'Spa'],
            'bookings': 80,
            'pricePerNight': 120.0,
            'availableRooms': 2,
          },
        ],
      },
      {
        'id': '2',
        'name': 'Hồng Công',
        'country': 'Trung Quốc',
        'hotels': [
          {
            'images': [
              'img/img_hotel10.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Khách sạn X',
            'rating': 4.8,
            'distance': 1.5,
            'amenities': ['Spa cao cấp', 'Nhà hàng 5 sao', 'Bãi biển riêng'],
            'bookings': 150,
            'pricePerNight': 150.0,
            'availableRooms': 10,
          },
          {
            'images': [
              'img/img_hotel5.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Khách sạn Y',
            'rating': 4.4,
            'distance': 3.0,
            'amenities': [
              'Bể bơi trên tầng',
              'Nhà hàng Panorama',
              'Dịch vụ đưa đón'
            ],
            'bookings': 100,
            'pricePerNight': 130.0,
            'availableRooms': 25,
          },
          {
            'images': [
              'img/img_hotel6.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Khách sạn Z',
            'rating': 4.2,
            'distance': 2.5,
            'amenities': [
              'Quán bar đỉnh cao',
              'Dịch vụ hỗ trợ xe đưa đón',
              'Nhà hàng đa dạng'
            ],
            'bookings': 120,
            'pricePerNight': 120.0,
            'availableRooms': 15,
          },
        ],
      },
      {
        'id': '3',
        'name': 'Tokyo',
        'country': 'Nhật Bản',
        'hotels': [
          {
            'images': [
              'img/img_hotel4.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Tokyo Hotel 1',
            'rating': 4.7,
            'distance': 2.0,
            'amenities': ['Spa', 'Nhà hàng trên tầng', 'Dịch vụ đưa đón'],
            'bookings': 200,
            'pricePerNight': 180.0,
            'availableRooms': 20,
          },
          {
            'images': [
              'img/img_hotel7.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Tokyo Hotel 2',
            'rating': 4.5,
            'distance': 3.5,
            'amenities': ['Quán bar', 'Dịch vụ phòng 24/24', 'Gần trung tâm'],
            'bookings': 150,
            'pricePerNight': 160.0,
            'availableRooms': 15,
          },
          {
            'images': [
              'img/img_hotel9.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Tokyo Hotel 3',
            'rating': 4.3,
            'distance': 1.8,
            'amenities': ['Bể bơi', 'Nhà hàng đa dạng', 'Gym'],
            'bookings': 180,
            'pricePerNight': 140.0,
            'availableRooms': 25,
          },
        ],
      },
      {
        'id': '4',
        'name': 'Đài Bắc',
        'country': 'Đài Loan',
        'hotels': [
          {
            'images': [
              'img/img_hotel4.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Đài Bắc Hotel 1',
            'rating': 4.2,
            'distance': 3.0,
            'amenities': [
              'Lễ tân 24/24',
              'Hỗ trợ tận tình',
              'Nhà hàng trên tầng'
            ],
            'bookings': 100,
            'pricePerNight': 120.0,
            'availableRooms': 30,
          },
          {
            'images': [
              'img/img_hotel7.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Đài Bắc Hotel 2',
            'rating': 4.0,
            'distance': 2.5,
            'amenities': ['Bể bơi trên mái', 'Quán bar', 'Spa'],
            'bookings': 80,
            'pricePerNight': 100.0,
            'availableRooms': 20,
          },
          {
            'images': [
              'img/img_hotel2.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Đài Bắc Hotel 3',
            'rating': 3.8,
            'distance': 4.5,
            'amenities': ['Dịch vụ phòng 24/24', 'Nhà hàng đa dạng', 'Gym'],
            'bookings': 120,
            'pricePerNight': 80.0,
            'availableRooms': null,
          },
        ],
      },
      {
        'id': '5',
        'name': 'Tân Gia Ba',
        'country': 'Trung Quốc',
        'hotels': [
          {
            'images': [
              'img/img_hotel9.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Tân Gia Ba Hotel 1',
            'rating': 4.6,
            'distance': 2.2,
            'amenities': ['Bể bơi', 'Nhà hàng 5 sao', 'Dịch vụ đưa đón'],
            'bookings': 130,
            'pricePerNight': 130.0,
            'availableRooms': 25,
          },
          {
            'images': [
              'img/img_hotel10.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Tân Gia Ba Hotel 2',
            'rating': 4.3,
            'distance': 3.8,
            'amenities': ['WiFi miễn phí', 'Spa cao cấp', 'Quán bar'],
            'bookings': 110,
            'pricePerNight': 110.0,
            'availableRooms': 20,
          },
          {
            'images': [
              'img/img_hotel3.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Tân Gia Ba Hotel 3',
            'rating': 4.1,
            'distance': 2.5,
            'amenities': ['Lễ tân 24/24', 'Bãi biển riêng', 'Nhà hàng đa dạng'],
            'bookings': 100,
            'pricePerNight': 100.0,
            'availableRooms': 15,
          },
        ],
      },
      {
        'id': '6',
        'name': 'BăngKok',
        'country': 'Thái Lan',
        'hotels': [
          {
            'images': [
              'img/img_hotel1.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'BăngKok Hotel 1',
            'rating': 4.4,
            'distance': 2.0,
            'amenities': [
              'Bể bơi trên tầng',
              'Dịch vụ phòng 24/24',
              'Quán bar'
            ],
            'bookings': 140,
            'pricePerNight': 120.0,
            'availableRooms': 20,
          },
          {
            'images': [
              'img/img_hotel7.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'BăngKok Hotel 2',
            'rating': 4.2,
            'distance': 3.5,
            'amenities': ['Spa', 'Nhà hàng Panorama', 'Gần trung tâm'],
            'bookings': 120,
            'pricePerNight': 100.0,
            'availableRooms': 25,
          },
          {
            'images': [
              'img/img_hotel2.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'BăngKok Hotel 3',
            'rating': 4.0,
            'distance': 1.8,
            'amenities': ['Lễ tân 24/24', 'Hỗ trợ tận tình', 'Gym'],
            'bookings': 100,
            'pricePerNight': 80.0,
            'availableRooms': 30,
          },
        ],
      },
      {
        'id': '7',
        'name': 'Osaka',
        'country': 'Nhật Bản',
        'hotels': [
          {
            'images': [
              'img/img_hotel6.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Osaka Hotel 1',
            'rating': 4.7,
            'distance': 2.5,
            'amenities': [
              'Nhà hàng đa dạng',
              'Dịch vụ đưa đón',
              'Bãi biển riêng'
            ],
            'bookings': 160,
            'pricePerNight': 150.0,
            'availableRooms': 15,
          },
          {
            'images': [
              'img/img_hotel4.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Osaka Hotel 2',
            'rating': 4.5,
            'distance': 3.0,
            'amenities': ['WiFi miễn phí', 'Spa', 'Gần trung tâm'],
            'bookings': 120,
            'pricePerNight': 130.0,
            'availableRooms': 20,
          },
          {
            'images': [
              'img/img_hotel1.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Osaka Hotel 3',
            'rating': 4.3,
            'distance': 4.0,
            'amenities': [
              'Quán bar đỉnh cao',
              'Bể bơi trên mái',
              'Hỗ trợ tận tình'
            ],
            'bookings': 100,
            'pricePerNight': 110.0,
            'availableRooms': 25,
          },
        ],
      },
      {
        'id': '8',
        'name': 'New York',
        'country': 'United States',
        'hotels': [
          {
            'images': [
              'img/img_hotel1.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'New York Hotel 1',
            'rating': 4.6,
            'distance': 2.2,
            'amenities': ['Bể bơi', 'Nhà hàng 5 sao', 'Dịch vụ đưa đón'],
            'bookings': 140,
            'pricePerNight': 130.0,
            'availableRooms': 25,
          },
          {
            'images': [
              'img/img_hotel10.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'New York Hotel 2',
            'rating': 4.3,
            'distance': 3.8,
            'amenities': ['WiFi miễn phí', 'Spa cao cấp', 'Quán bar'],
            'bookings': 120,
            'pricePerNight': 110.0,
            'availableRooms': 20,
          },
          {
            'images': [
              'img/img_hotel9.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'New York Hotel 3',
            'rating': 4.1,
            'distance': 2.5,
            'amenities': ['Lễ tân 24/24', 'Bãi biển riêng', 'Nhà hàng đa dạng'],
            'bookings': 100,
            'pricePerNight': 100.0,
            'availableRooms': 15,
          },
        ],
      },
      {
        'id': '9',
        'name': 'Paris',
        'country': 'France',
        'hotels': [
          {
            'images': [
              'img/img_hotel4.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Paris Hotel 1',
            'rating': 4.4,
            'distance': 2.0,
            'amenities': [
              'Bể bơi trên tầng',
              'Dịch vụ phòng 24/24',
              'Quán bar'
            ],
            'bookings': 120,
            'pricePerNight': 120.0,
            'availableRooms': 20,
          },
          {
            'images': [
              'img/img_hotel5.jpeg',
              'img/img_hotel2.jpeg',
              'img/img_hotel3.jpeg',
              'img/img_hotel4.jpeg',
              'img/img_hotel5.jpeg'
            ],
            'hotelName': 'Paris Hotel 2',
            'rating': 4.2,
            'distance': 3.5,
            'amenities': ['Spa', 'Nhà hàng Panorama', 'Gần trung tâm'],
            'bookings': 100,
            'pricePerNight': 100.0,
            'availableRooms': 25,
          },
        ]
      },
    ];
  }
}
