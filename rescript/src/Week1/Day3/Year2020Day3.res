let input = Node.Fs.readFileAsUtf8Sync("input/Week1/Year2020Day3.sample.txt")
let inputArray = Js.String2.split(input, "\n")

type intOrSting = Int(int) | String(string)

let treeToOne = char => {
  if char === "#" {
    1
  } else {
    0
  }
}

let treeToOne2 = char => char === "#" ? 1 : 0

type slopes = {
  right: int,
  down: int,
}

let getByCoord = (coord, input: array<array<'a>>) => {
  input
  ->Belt.Array.get(coord.down)
  ->Belt.Option.map(line => line->Belt.Array.get(coord.right))
}

let slope : slopes = {
  right: 3,
  down: 2,
}

type right = {
  mutable newRight : int
}

let constUnit = (_) => ()

let makeCoords2 = (slope, inputArray) => {
  let end = inputArray->Belt.Array.length - 1

  let rec go = (acc, newRight, i) => {
    if (i > end) {
      acc
    } else {
      let right = mod(newRight + slope.right, Js.String2.length(inputArray[i]))
      let newAcc = acc->Belt.Array.concat([(right, i)])

      go(newAcc, right, i + slope.down)
    }
  }

  go([], 0, slope.down)
}

makeCoords2(slope, inputArray)->Js.log