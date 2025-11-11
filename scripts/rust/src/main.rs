use std::{fs, time::SystemTime};
fn main(){
    let note = std::env::args().skip(1).collect::<Vec<_>>().join(" ");
    let t = SystemTime::now();
    let ts = chrono::DateTime::<chrono::Local>::from(t);
    let path = format!("{}/logs/systemd-notes/{}.txt", std::env::var("HOME").unwrap(), ts.format("%Y%m%d-%H%M%S"));
    fs::create_dir_all(format!("{}/logs/systemd-notes", std::env::var("HOME").unwrap())).unwrap();
    fs::write(&path, note).unwrap();
    println!("Note enregistrée: {}", path);
}
