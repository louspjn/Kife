fn seedgen(x: u64, y: u64, z: u64, seed: u64) -> u64 {
    (seed ^ (x * y * z)) % (10_u64.pow(11))
}

fn main() {
    let x = 279;
    let y = 2937;
    let z = 290;

    let seed = 12893783832;

    let output = seedgen(x, y, z, seed);

    println!("{seed}\n{output}");

    println!("{}", (seedgen(x, y, z, output)));
    println!("{}", (seedgen(x, y, z, output)) == seed);
}
