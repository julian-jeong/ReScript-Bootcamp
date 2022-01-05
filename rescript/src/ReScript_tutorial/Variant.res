/*
  Variant
*/

type weather = 
  | Sunny
  | Rainy
  | Snowy

let current_weather: weather = Sunny

let weather_to_feeling: string = 
  if (current_weather == Sunny) {
    "happy"
  } else if (current_weather == Rainy) {
    "sad"
  } else {
    "cold"
  }

weather_to_feeling->Js.log

let current_weather: weather = Rainy

let weather_to_feeling: string = 
  switch current_weather {
  | Sunny => "happy"
  | Rainy => "sad"
  | Snowy => "cold"
  }

weather_to_feeling->Js.log

// switch 문과 if 문은 동일한 형태로 동작한다.

type option<'a> = 
  | Some('a)
  | None

let my_option: option<string> = Some("hello world")
let my_option2: option<string> = None

let tell_me_my_value: string = 
  switch my_option {
  | Some(x) => x
  | None => "You didn't give me a string"
  }

let tell_me_my_value2: string = 
  switch my_option2 {
  | Some(x) => x
  | None => "You didn't give me a string"
  }

tell_me_my_value->Js.log
tell_me_my_value2->Js.log

// Variant는 반드시 생성자가 있어야합니다.

/*
  type myType = int | string
  -> 이렇게 쓰는거는 안됩니다
*/

type mytype = Int(int) | String(string)
//생성자가 있어야합니다.