use std::io;
use std::collections::HashMap;

fn devisor(n:i64) -> i64 {
    (1..=n).filter(|p| n % p == 0).count() as i64
}

fn main() {
    let mut buffer = String::new();
    io::stdin().read_line(&mut buffer).unwrap();
    let n = buffer.trim_end().parse::<i64>().unwrap();

    let mut result = 0;
    let mut memo:HashMap<i64, i64> = HashMap::default();
    for i in 1..n {
        let x = if let Some(v) = memo.get(&i) {
            v.clone()
        } else {
            let d = devisor(i);
            memo.insert(i, d);
            d
        };
        let y = if let Some(v) = memo.get(&(n - i)) {
            v.clone()
        } else {
            let d = devisor(n - i);
            memo.insert(n - i, d);
            d
        };
        result += x * y
    }

    println!("{}", result);
}
