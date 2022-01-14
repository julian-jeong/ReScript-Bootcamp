/* 
  Day 4: Passport Processing
*/

let input = Node.Fs.readFileAsUtf8Sync("input/Week2/Year2020Day4.sample.txt")

// cm(int), in(int)
// type hgt = Cm(int) | In(int)
// type ecl = Amb | Blu | Brn | Ary | Grn | Hzl | Oth

// Phantom type
type passport = {
  byr: int,
  iyr: int,
  eyr: int,
  hgt: string,
  hcl: string,
  ecl: string,
  pid: string,
  cid: option<int>,
}

module StrCmp = Belt.Id.MakeComparable({
  type t = string
  let cmp = (a, b) => Pervasives.compare(a, b)
})

let splitStrJoin = (arr, str) => 
  arr
    ->Js.String2.split(str)
    ->Js.Array2.joinWith(" ")
    
let multipleLineToSplit = (str) =>
  str
    ->Js.String2.split("\n")
    ->Js.Array2.joinWith(" ")
    ->Js.String2.split(" ")

// exception CustomError(string)

let keyValueStringToMap = (arr) =>
  arr
    ->Belt.Array.map((arr) => Js.String2.split(arr, ":"))
    // Exhaustiveness checking
    ->Belt.Array.keepMap((arr) => {
      switch Some(arr) {
      | Some([key, value]) => Some(key, value)
      | _ => None
      }
      // throw CustomError("ack!")
    })
    ->Belt.Map.fromArray(~id=module(StrCmp))

let stringToMap = (str) => 
  str
    ->multipleLineToSplit
    ->keyValueStringToMap

let inputToMap = (input) => 
  input
    ->Js.String2.split("\n\n") 
    ->Belt.Array.map(stringToMap)

let validPassport = (passport) => 
  ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
  ->Belt.Array.every(Belt.Map.has(passport))

let arrayToList = (data) => 
  data
  ->Belt.Map.toArray
  ->Belt.Array.map(((a, b)) => (a, b))
  ->Belt.List.fromArray

// type foo = {
//   byr: int,
//   iyr: int,
//   eyr: int,
// }

let listToPassportType = (list) => {
  let byr = list->Belt.List.getAssoc("byr", ((k, v) => k == v))->Belt.Option.flatMap(Belt.Int.fromString)
  let iyr = list->Belt.List.getAssoc("iyr", ((k, v) => k == v))->Belt.Option.flatMap(Belt.Int.fromString)
  let eyr = list->Belt.List.getAssoc("eyr", ((k, v) => k == v))->Belt.Option.flatMap(Belt.Int.fromString)
  let hgt = list->Belt.List.getAssoc("hgt", ((k, v) => k == v))
  let hcl = list->Belt.List.getAssoc("hcl", ((k, v) => k == v))
  let ecl = list->Belt.List.getAssoc("ecl", ((k, v) => k == v))
  let pid = list->Belt.List.getAssoc("pid", ((k, v) => k == v))
  let cid = list->Belt.List.getAssoc("cid", ((k, v) => k == v))->Belt.Option.flatMap(Belt.Int.fromString)
  
  switch (byr, iyr, eyr, hgt, hcl, ecl, pid) {
  | (Some(byr), Some(iyr), Some(eyr), Some(hgt), Some(hcl), Some(ecl), Some(pid)) => 
    let newObject: passport = {
      byr: byr,
      iyr: iyr,
      eyr: eyr,
      hgt: hgt,    
      hcl: hcl, 
      ecl: ecl,
      pid: pid,
      cid: cid
    }

    Some(newObject)
  | _ => {
    None
  }}
}

let checkRequiredFields = (passport) => {
  let fieldDefinitions = {
    "hgt": %re("/^(?:(?:1[5-9][0-9]|19[0-3])cm|(?:59|6[0-9]|7[0-6])in)$/"),
    "hcl": %re("/^#[0-9a-f]{6}$/"),
    "ecl": %re("/^(?:amb|blu|brn|gry|grn|hzl|oth)$/"),//
    "pid": %re("/^\d{9}$/")
  }

  let byr = Belt.Range.some(1920, 2002, (i) => i == passport.byr)  
  let iyr = Belt.Range.some(2010, 2020, (i) => i == passport.iyr)  
  let eyr = Belt.Range.some(2020, 2030, (i) => i == passport.eyr) 
  let hgt = Js.Re.test_(fieldDefinitions["hgt"], passport.hgt)
  let hcl = Js.Re.test_(fieldDefinitions["hcl"], passport.hcl)
  let ecl = Js.Re.test_(fieldDefinitions["ecl"], passport.ecl)
  let pid = Js.Re.test_(fieldDefinitions["pid"], passport.pid)

  if Belt.Array.every([byr, iyr, eyr, hgt, hcl, ecl, pid], (x) => x == true) {
    Some(passport)
  } else {
    None
  }
}

let countVaildPassports = (input) => 
  input
  ->inputToMap
  ->Belt.Array.keep(validPassport)
  ->Belt.Array.map(arrayToList)
  ->Belt.Array.keepMap(listToPassportType)
  ->Belt.Array.keepMap(checkRequiredFields)
  ->Belt.Array.length

countVaildPassports(input)->Js.log