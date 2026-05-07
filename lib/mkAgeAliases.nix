secretsPath: key: {
  "age:${key}:decrypt" = "age --decrypt -i ${secretsPath}/${key}.age.txt";
  "age:${key}:encrypt" = "age --encrypt -i ${secretsPath}/${key}.age.txt";
}
