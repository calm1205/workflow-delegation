import { add, sumArray } from "./math"
import { greet } from "./util"

const numbers = [1, 2, 3, 4]
const unused = 42

console.log("sum:", sumArray(numbers))
console.log("1 + 2 =", add(1, 2))
console.log(greet("Biome"))
