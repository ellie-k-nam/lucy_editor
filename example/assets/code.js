// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}
// 8자리 오늘날짜구하기
function getToday() {
  let today = new Date();
  let year  = today.getFullYear(); // 년도

  // 월, 일일경우 getMonth, getDate 일때는 1자리로 가져오는경우있다.
  let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
  let date  = ("0" + today.getDate()).slice(-2);  // 날짜
  let time  = today.getTime(); // 시간
  let input_date = year+ "" +month+ "" +date;

  return input_date;
}

// 숫자 3자리마다 "," 찍기
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 텍스트 컬러바꾸기 ("1A": 10%, "FF":100%) KSS
function  changeRateColor(rate) {
  let fg_color = "#FAFAFA";
  if(rate > 0)         fg_color = "UpBG";
  else if(rate < 0)    fg_color = "DownBG";

  return fg_color;
}


// 숫자 컴마 단위바꾸기(금액단위)
function priceToStringText(price) {

  let money     = parseInt(price);
  if(Math.abs(money)/10000 >= 1) {
     money_unit = "만";
     money      = Math.floor((price/10000 + Number.EPSILON) * 10)/10;
     return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + money_unit;
  }
  return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 시간비교처리
function getDateDiff(item) {
  let datetime = item.datez8.substr(0,4) +"/"+ item.datez8.substr(4,2) +"/"+ item.datez8.substr(6,2) +" "+ item.timez6.substr(0,2) +":"+ item.timez6.substr(2,2) +":"+ item.timez6.substr(4,2);
  let old_date = new Date(datetime);
  let diff     = (TODAY.getTime() - old_date.getTime()) / (60 * 60 * 1000);

  return parseFloat(diff) < 24.0 ? parseInt(diff)+"시간전" : datetime;

}