// data_provider.dart

class bottomState {
  bool active;
  bool arrow;

  bottomState(this.active, this.arrow);
}

class DataDetail {
  static List<Map<String, String>> DateData() {
    return [
      {
        'img': 'img/tour.webp',
        'title': 'Hôm nay',
      },
      {
        'img': 'img/ticket.webp',
        'title': 'Ngày mai',
      },
      {
        'img': 'img/hotel.webp',
        'title': '7/1',
      },
      {
        'img': 'img/move.webp',
        'title': 'Tất cả cá ngày',
      },
      {
        'img': 'img/move.webp',
        'title': 'Tất cả cá ngày',
      },
      {
        'img': 'img/move.webp',
        'title': 'Tất cả cá ngày',
      },
      {
        'img': 'img/move.webp',
        'title': 'Tất cả cá ngày',
      },
    ];
  }

  static List<Map<String, String>> ServiceData() {
    return [
      {
        'title': 'Người lớn',
        'subTitle': 'Đặt ngay hôm nay',
        'price': '467,500',
      },
      {
        'title': 'Trẻ em',
        'subTitle': 'Đặt ngay hôm nay',
        'price': '200,000',
      },
      {
        'title': 'Người cao tuổi',
        'subTitle': 'Đặt ngay hôm nay',
        'price': '400,000',
      },
      {
        'title': 'Sinh viên',
        'subTitle': 'Đặt ngay hôm nay',
        'price': '300,000',
      },
      {
        'title': 'Sinh viên',
        'subTitle': 'Đặt ngay hôm nay',
        'price': '300,000',
      },
    ];
  }
}
