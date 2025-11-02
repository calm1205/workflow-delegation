export const add = (a: number, b: number) => {
  return a + b
}

export const sumArray = (values: number[]) => {
  let total = 0
  for (const v of values) {
    total = total + v
  }
  return total
}
