package main

import (
    "github.com/juberti/abbey/utils"
)

func factors(n int) []int {
    a := make([]int, 0)
    for i := 1; i * i <= n; i++ {
        if n % i == 0 {
            a = append(a, i)
            if d := n / i; d != i {
                a = append(a, d)
            }
        }
    }
    return a
}

func main() {
    utils.SetTestData(td)
    utils.ForEachInt2(func(l, b int) {
        t := 0
        n := b - l
        for _, f := range factors(n) {
            if n / f % 2 == 0 && 4 * f <= l {
                t++
            }
        }
        utils.Print(t)
    })
}

const td = `
input data:
4
6 10
26 136
106 336
200 500

answer:
1 2 3 9
