import 'package:flutter/material.dart';
import 'package:show_ticket_app/models/event.dart';

// images url
const logoImg = "assets/images/logo.png";
const fbImg = "assets/images/facebook_logo.png";
const googleImg = "assets/images/google_logo.png";
const appleImg = "assets/images/apple_logo.png";
const homeLogoImg = "assets/images/home_logo.png";
const erasTourImg = "assets/images/eras_tour.jpg";
const djSnakeFesImg = "assets/images/dj_snake_festival.jpg";
const bornPinkConcertImg = "assets/images/born_pink_concert.png";
const victoriaSecretImg = "assets/images/victoria_secret_show.jpg";
const worldDjFesImg = "assets/images/world_dj_festival.jpg";

// icons url
const eyeOpenIcon = "assets/icons/eye-open.png";
const eyeClosedIcon = "assets/icons/eye-closed.png";
const refreshIcon = "assets/icons/refresh-icon.png";
const searchIcon = "assets/icons/search_icon.png";
const heartIcon = "assets/icons/heart_icon.png";
const heartFilledIcon = "assets/icons/heart_icon_filled.png";
const greyHeartIcon = "assets/icons/grey_heart_icon.png";
const homeIcon = "assets/icons/home_icon.png";
const homeFilledIcon = "assets/icons/home_icon_filled.png";
const ticketIcon = "assets/icons/ticket_icon.png";
const ticketFilledIcon = "assets/icons/ticket_filled_icon.png";
const profileIcon = "assets/icons/profile_icon.png";
const profileFilledIcon = "assets/icons/profile_filled_icon.png";

// color url
const backgroundColor = Color(0xff181818);
const primaryColor = Color(0xff7657EA);
const grey36Color = Color(0xff363636);
const grayContentColor = Color(0xffD8D8D8);
const colorTextBox = Color(0xffF2F2F2);
const grey46Color = Color(0xff464646);
const grey5BColor = Color(0xff5B5B5B);
const greyC5Color = Color(0xffC5C5C5);

// figures
const buttonRadius = BorderRadius.all(Radius.circular(10.0));
const cardRadius = BorderRadius.all(Radius.circular(20.0));
const defaultPadding = 16.0;
const defaultTextSize = 14.0;
const defaultButtonHeight = 50.0;

// strings
const loginTextUpper = "ĐĂNG NHẬP";
const signUpTextUpper = "ĐĂNG KÝ";
const loginText = "Đăng nhập";
const signUpText = "Đăng ký";
const noAccount = "Chưa có tài khoản? ";
const registerNow = "Đăng ký ngay";
const email = "Email";
const password = "Mật khẩu";
const forgetPassword = "Quên mật khẩu?";
const loginWith = "Hoặc đăng nhập bằng";
const haveAccount = "Đã có tài khoản? ";
const confirmedPassword = "Xác nhận mật khẩu";
const forgetPasswordUpper = "QUÊN MẬT KHẨU";
const otpText = "Mã xác nhận";
const continueText = "Tiếp tục";
const resetPassword = "ĐỔI MẬT KHẨU";
const newPassword = "Mật khẩu mới";
const confirm = "Xác nhận";
const outstandingEventsText = "Sự Kiện Nổi Bật";
const seeAllText = "Xem Tất Cả";
const concertText = "Nhạc Hội";

// fake data

// banner image list
const bannerImageList = [
  erasTourImg,
  djSnakeFesImg,
  bornPinkConcertImg,
  victoriaSecretImg,
  worldDjFesImg
];

// outstanding event list
List<Event> outstandingEventList = [
  Event(
    eventName: "Eras Tour 2025",
    eventImg: erasTourImg,
    minPrice: "800.000",
    maxPrice: "2.000.000",
    tags: [
      "Hồ Chí Minh",
      "30.07.2025"
    ]
  ),
  Event(
    eventName: "2025 - DJ World Festival",
    eventImg: worldDjFesImg,
    minPrice: "800.000",
    maxPrice: "2.000.000",
    tags: [
      "Hồ Chí Minh",
      "30.07.2025"
    ]
  ),
  Event(
    eventName: "DJ Snake Festival 2025",
    eventImg: djSnakeFesImg,
    minPrice: "800.000",
    maxPrice: "2.000.000",
    tags: [
      "Hồ Chí Minh",
      "30.07.2025"
    ]
  ),
  Event(
    eventName: "Born Pink Concert 2025",
    eventImg: bornPinkConcertImg,
    minPrice: "800.000",
    maxPrice: "2.000.000",
    tags: [
      "Hồ Chí Minh",
      "30.07.2025"
    ]
  ),
  Event(
    eventName: "Victoria Secret Fashion Show 2025",
    eventImg: victoriaSecretImg,
    minPrice: "800.000",
    maxPrice: "2.000.000",
    tags: [
      "Hồ Chí Minh",
      "30.07.2025"
    ]
  ),
];
