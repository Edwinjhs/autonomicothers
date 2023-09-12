const rounds = +input();

new Array(rounds).fill("").forEach(x => {
    const [amount, base, type] = input().split(" ");
    let result = 0;
    if (type == "n") {
        if (Math.floor(amount / base) == 1) {
            result = Math.abs(1 - (amount % base))
        } else {
            for (let i = 1; i <= base; i++) {
                if ((amount - i) % (+base + 1) == 0) {
                    result = i;
                    break;
                }
            }
        }
        output(`${result} `)
    } else {
         if (Math.floor(amount / base) == 2) {
            result = amount - base - 2
        } else {
            for (let i = 1; i <= base; i++) {
                if ((amount - i) % (+base + 1) == 1) {
                    result = i;
                    break;
                }
            }
        }
        output(`${result} `)
    }
})
