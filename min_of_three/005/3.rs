use std::io;

fn main() {
    let mut countbuf = String::new();
    let count = match io::stdin().read_line(&mut countbuf) {
        Ok(_) => countbuf.trim().parse::<usize>().ok().expect("Non-integer string"),
        Err(_) => 0,
    };

    let mut answer: Vec<i32> = Vec::new();
    for _ in 0..count {
        let mut linebuf = String::new();
        if let Ok(_) = io::stdin().read_line(&mut linebuf) {
            let split = linebuf.split_whitespace();

            let nums: Vec<i32> = split.map(|s| s.trim().parse().ok().expect("Non-integer string")).collect();
            answer.push(*nums.iter().min().unwrap());
        }
    }

    for a in answer {
        print!("{} ", a);
    }
    println!("");
}
