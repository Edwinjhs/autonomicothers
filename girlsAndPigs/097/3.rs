use std::io::{self, BufRead};

fn main() {
    let mut buffer = String::new();
    let input = io::stdin();
    input.read_line(&mut buffer).expect("Failed to read line");
    let number_of_tests = buffer.trim().parse().unwrap();

    for line in input.lock().lines().take(number_of_tests) {
        let mut data: Vec<u32> = line.unwrap()
            .split_whitespace()
            .map(|n| n.parse().unwrap())
            .collect();
        let (a, b) = (data[0], data[1]);
        let possible_z: Vec<_> = (6..b)
            .filter(|z| z % 2 == 0 && (b - a) % (z - 4) == 0)
            .collect();
        let results = possible_z
            .iter()
            .filter(|z| a / 2 > 2 * (b - a) / (*z - 4) && (a / 2) - 2 * (b - a) / (*z - 4) > 0)
            .count();
        print!("{} ", results);
    }

    println!()
}
