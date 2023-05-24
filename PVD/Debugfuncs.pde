// For debugging: Prints all the bits of one byte.
void printBinary(int x){
  for(int i=7; i>=0;i--){
    print((x>>i)&1);
  }
  println();
}

//Prints 32 bits of four bytes
void printFour(int x){
  for(int i=31; i>=0;i--){
    print((x>>i)&1);
    if (i%8 == 0) print(" ");
  }
  println();
}