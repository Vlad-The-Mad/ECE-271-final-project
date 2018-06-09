#include <iostream>
#include <fstream>

int main() {
  std::ofstream binary_write_file;
  binary_write_file.open("RAM_input.txt");
  char data[16];
  if (binary_write_file.is_open()) {
    binary_write_file << "1010000011110000\n";
    data = "1010000011110000";
  for (int i = 10; i < 512; i++) {
    binary_write_file << data << std::endl;
  }

  for (int i = 512; i < 1024; i++) {
    binary_write_file << "0000000011110000";
  }
}
else std::cout << "wasn't open" << std::endl;
  binary_write_file.close();
  return 0;
}
